; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35734 () Bool)

(assert start!35734)

(declare-fun b!358920 () Bool)

(declare-fun res!199487 () Bool)

(declare-fun e!219782 () Bool)

(assert (=> b!358920 (=> (not res!199487) (not e!219782))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19933 0))(
  ( (array!19934 (arr!9460 (Array (_ BitVec 32) (_ BitVec 64))) (size!9812 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19933)

(assert (=> b!358920 (= res!199487 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9812 _keys!1456))))))

(declare-fun b!358921 () Bool)

(declare-fun res!199489 () Bool)

(assert (=> b!358921 (=> (not res!199489) (not e!219782))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358921 (= res!199489 (validKeyInArray!0 k0!1077))))

(declare-fun mapIsEmpty!13788 () Bool)

(declare-fun mapRes!13788 () Bool)

(assert (=> mapIsEmpty!13788 mapRes!13788))

(declare-fun b!358922 () Bool)

(assert (=> b!358922 (= e!219782 (not (validKeyInArray!0 (select (arr!9460 _keys!1456) from!1805))))))

(declare-fun b!358923 () Bool)

(declare-fun res!199488 () Bool)

(assert (=> b!358923 (=> (not res!199488) (not e!219782))))

(assert (=> b!358923 (= res!199488 (= (select (arr!9460 _keys!1456) from!1805) k0!1077))))

(declare-fun b!358924 () Bool)

(declare-fun res!199483 () Bool)

(assert (=> b!358924 (=> (not res!199483) (not e!219782))))

(declare-fun arrayContainsKey!0 (array!19933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358924 (= res!199483 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun res!199485 () Bool)

(assert (=> start!35734 (=> (not res!199485) (not e!219782))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35734 (= res!199485 (validMask!0 mask!1842))))

(assert (=> start!35734 e!219782))

(assert (=> start!35734 true))

(declare-fun array_inv!6958 (array!19933) Bool)

(assert (=> start!35734 (array_inv!6958 _keys!1456)))

(declare-datatypes ((V!11893 0))(
  ( (V!11894 (val!4138 Int)) )
))
(declare-datatypes ((ValueCell!3750 0))(
  ( (ValueCellFull!3750 (v!6332 V!11893)) (EmptyCell!3750) )
))
(declare-datatypes ((array!19935 0))(
  ( (array!19936 (arr!9461 (Array (_ BitVec 32) ValueCell!3750)) (size!9813 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19935)

(declare-fun e!219778 () Bool)

(declare-fun array_inv!6959 (array!19935) Bool)

(assert (=> start!35734 (and (array_inv!6959 _values!1208) e!219778)))

(declare-fun mapNonEmpty!13788 () Bool)

(declare-fun tp!27846 () Bool)

(declare-fun e!219781 () Bool)

(assert (=> mapNonEmpty!13788 (= mapRes!13788 (and tp!27846 e!219781))))

(declare-fun mapKey!13788 () (_ BitVec 32))

(declare-fun mapValue!13788 () ValueCell!3750)

(declare-fun mapRest!13788 () (Array (_ BitVec 32) ValueCell!3750))

(assert (=> mapNonEmpty!13788 (= (arr!9461 _values!1208) (store mapRest!13788 mapKey!13788 mapValue!13788))))

(declare-fun b!358925 () Bool)

(declare-fun tp_is_empty!8187 () Bool)

(assert (=> b!358925 (= e!219781 tp_is_empty!8187)))

(declare-fun b!358926 () Bool)

(declare-fun e!219780 () Bool)

(assert (=> b!358926 (= e!219780 tp_is_empty!8187)))

(declare-fun b!358927 () Bool)

(declare-fun res!199482 () Bool)

(assert (=> b!358927 (=> (not res!199482) (not e!219782))))

(declare-datatypes ((List!5449 0))(
  ( (Nil!5446) (Cons!5445 (h!6301 (_ BitVec 64)) (t!10599 List!5449)) )
))
(declare-fun arrayNoDuplicates!0 (array!19933 (_ BitVec 32) List!5449) Bool)

(assert (=> b!358927 (= res!199482 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5446))))

(declare-fun b!358928 () Bool)

(declare-fun res!199484 () Bool)

(assert (=> b!358928 (=> (not res!199484) (not e!219782))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358928 (= res!199484 (and (= (size!9813 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9812 _keys!1456) (size!9813 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358929 () Bool)

(assert (=> b!358929 (= e!219778 (and e!219780 mapRes!13788))))

(declare-fun condMapEmpty!13788 () Bool)

(declare-fun mapDefault!13788 () ValueCell!3750)

(assert (=> b!358929 (= condMapEmpty!13788 (= (arr!9461 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3750)) mapDefault!13788)))))

(declare-fun b!358930 () Bool)

(declare-fun res!199486 () Bool)

(assert (=> b!358930 (=> (not res!199486) (not e!219782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19933 (_ BitVec 32)) Bool)

(assert (=> b!358930 (= res!199486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35734 res!199485) b!358928))

(assert (= (and b!358928 res!199484) b!358930))

(assert (= (and b!358930 res!199486) b!358927))

(assert (= (and b!358927 res!199482) b!358921))

(assert (= (and b!358921 res!199489) b!358920))

(assert (= (and b!358920 res!199487) b!358924))

(assert (= (and b!358924 res!199483) b!358923))

(assert (= (and b!358923 res!199488) b!358922))

(assert (= (and b!358929 condMapEmpty!13788) mapIsEmpty!13788))

(assert (= (and b!358929 (not condMapEmpty!13788)) mapNonEmpty!13788))

(get-info :version)

(assert (= (and mapNonEmpty!13788 ((_ is ValueCellFull!3750) mapValue!13788)) b!358925))

(assert (= (and b!358929 ((_ is ValueCellFull!3750) mapDefault!13788)) b!358926))

(assert (= start!35734 b!358929))

(declare-fun m!356583 () Bool)

(assert (=> b!358921 m!356583))

(declare-fun m!356585 () Bool)

(assert (=> b!358927 m!356585))

(declare-fun m!356587 () Bool)

(assert (=> b!358923 m!356587))

(declare-fun m!356589 () Bool)

(assert (=> b!358924 m!356589))

(assert (=> b!358922 m!356587))

(assert (=> b!358922 m!356587))

(declare-fun m!356591 () Bool)

(assert (=> b!358922 m!356591))

(declare-fun m!356593 () Bool)

(assert (=> mapNonEmpty!13788 m!356593))

(declare-fun m!356595 () Bool)

(assert (=> start!35734 m!356595))

(declare-fun m!356597 () Bool)

(assert (=> start!35734 m!356597))

(declare-fun m!356599 () Bool)

(assert (=> start!35734 m!356599))

(declare-fun m!356601 () Bool)

(assert (=> b!358930 m!356601))

(check-sat (not mapNonEmpty!13788) (not b!358924) (not start!35734) (not b!358922) tp_is_empty!8187 (not b!358930) (not b!358927) (not b!358921))
(check-sat)
