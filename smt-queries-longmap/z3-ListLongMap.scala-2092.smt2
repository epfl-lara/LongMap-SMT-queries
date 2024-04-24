; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35706 () Bool)

(assert start!35706)

(declare-fun b!358716 () Bool)

(declare-fun e!219641 () Bool)

(assert (=> b!358716 (= e!219641 false)))

(declare-fun lt!166265 () Bool)

(declare-datatypes ((array!19884 0))(
  ( (array!19885 (arr!9435 (Array (_ BitVec 32) (_ BitVec 64))) (size!9787 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19884)

(declare-datatypes ((List!5352 0))(
  ( (Nil!5349) (Cons!5348 (h!6204 (_ BitVec 64)) (t!10494 List!5352)) )
))
(declare-fun arrayNoDuplicates!0 (array!19884 (_ BitVec 32) List!5352) Bool)

(assert (=> b!358716 (= lt!166265 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5349))))

(declare-fun mapIsEmpty!13767 () Bool)

(declare-fun mapRes!13767 () Bool)

(assert (=> mapIsEmpty!13767 mapRes!13767))

(declare-fun mapNonEmpty!13767 () Bool)

(declare-fun tp!27825 () Bool)

(declare-fun e!219642 () Bool)

(assert (=> mapNonEmpty!13767 (= mapRes!13767 (and tp!27825 e!219642))))

(declare-fun mapKey!13767 () (_ BitVec 32))

(declare-datatypes ((V!11875 0))(
  ( (V!11876 (val!4131 Int)) )
))
(declare-datatypes ((ValueCell!3743 0))(
  ( (ValueCellFull!3743 (v!6326 V!11875)) (EmptyCell!3743) )
))
(declare-fun mapRest!13767 () (Array (_ BitVec 32) ValueCell!3743))

(declare-datatypes ((array!19886 0))(
  ( (array!19887 (arr!9436 (Array (_ BitVec 32) ValueCell!3743)) (size!9788 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19886)

(declare-fun mapValue!13767 () ValueCell!3743)

(assert (=> mapNonEmpty!13767 (= (arr!9436 _values!1208) (store mapRest!13767 mapKey!13767 mapValue!13767))))

(declare-fun b!358718 () Bool)

(declare-fun e!219640 () Bool)

(declare-fun e!219639 () Bool)

(assert (=> b!358718 (= e!219640 (and e!219639 mapRes!13767))))

(declare-fun condMapEmpty!13767 () Bool)

(declare-fun mapDefault!13767 () ValueCell!3743)

(assert (=> b!358718 (= condMapEmpty!13767 (= (arr!9436 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3743)) mapDefault!13767)))))

(declare-fun b!358719 () Bool)

(declare-fun tp_is_empty!8173 () Bool)

(assert (=> b!358719 (= e!219642 tp_is_empty!8173)))

(declare-fun b!358720 () Bool)

(assert (=> b!358720 (= e!219639 tp_is_empty!8173)))

(declare-fun b!358721 () Bool)

(declare-fun res!199392 () Bool)

(assert (=> b!358721 (=> (not res!199392) (not e!219641))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19884 (_ BitVec 32)) Bool)

(assert (=> b!358721 (= res!199392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358717 () Bool)

(declare-fun res!199393 () Bool)

(assert (=> b!358717 (=> (not res!199393) (not e!219641))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358717 (= res!199393 (and (= (size!9788 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9787 _keys!1456) (size!9788 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199391 () Bool)

(assert (=> start!35706 (=> (not res!199391) (not e!219641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35706 (= res!199391 (validMask!0 mask!1842))))

(assert (=> start!35706 e!219641))

(assert (=> start!35706 true))

(declare-fun array_inv!6974 (array!19886) Bool)

(assert (=> start!35706 (and (array_inv!6974 _values!1208) e!219640)))

(declare-fun array_inv!6975 (array!19884) Bool)

(assert (=> start!35706 (array_inv!6975 _keys!1456)))

(assert (= (and start!35706 res!199391) b!358717))

(assert (= (and b!358717 res!199393) b!358721))

(assert (= (and b!358721 res!199392) b!358716))

(assert (= (and b!358718 condMapEmpty!13767) mapIsEmpty!13767))

(assert (= (and b!358718 (not condMapEmpty!13767)) mapNonEmpty!13767))

(get-info :version)

(assert (= (and mapNonEmpty!13767 ((_ is ValueCellFull!3743) mapValue!13767)) b!358719))

(assert (= (and b!358718 ((_ is ValueCellFull!3743) mapDefault!13767)) b!358720))

(assert (= start!35706 b!358718))

(declare-fun m!356715 () Bool)

(assert (=> b!358716 m!356715))

(declare-fun m!356717 () Bool)

(assert (=> mapNonEmpty!13767 m!356717))

(declare-fun m!356719 () Bool)

(assert (=> b!358721 m!356719))

(declare-fun m!356721 () Bool)

(assert (=> start!35706 m!356721))

(declare-fun m!356723 () Bool)

(assert (=> start!35706 m!356723))

(declare-fun m!356725 () Bool)

(assert (=> start!35706 m!356725))

(check-sat tp_is_empty!8173 (not b!358716) (not b!358721) (not mapNonEmpty!13767) (not start!35706))
(check-sat)
