; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35796 () Bool)

(assert start!35796)

(declare-fun b!359635 () Bool)

(declare-fun res!199905 () Bool)

(declare-fun e!220314 () Bool)

(assert (=> b!359635 (=> (not res!199905) (not e!220314))))

(declare-datatypes ((array!20060 0))(
  ( (array!20061 (arr!9523 (Array (_ BitVec 32) (_ BitVec 64))) (size!9875 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20060)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20060 (_ BitVec 32)) Bool)

(assert (=> b!359635 (= res!199905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359636 () Bool)

(declare-fun e!220315 () Bool)

(declare-fun e!220318 () Bool)

(declare-fun mapRes!13902 () Bool)

(assert (=> b!359636 (= e!220315 (and e!220318 mapRes!13902))))

(declare-fun condMapEmpty!13902 () Bool)

(declare-datatypes ((V!11995 0))(
  ( (V!11996 (val!4176 Int)) )
))
(declare-datatypes ((ValueCell!3788 0))(
  ( (ValueCellFull!3788 (v!6371 V!11995)) (EmptyCell!3788) )
))
(declare-datatypes ((array!20062 0))(
  ( (array!20063 (arr!9524 (Array (_ BitVec 32) ValueCell!3788)) (size!9876 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20062)

(declare-fun mapDefault!13902 () ValueCell!3788)

(assert (=> b!359636 (= condMapEmpty!13902 (= (arr!9524 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3788)) mapDefault!13902)))))

(declare-fun b!359637 () Bool)

(declare-fun res!199907 () Bool)

(assert (=> b!359637 (=> (not res!199907) (not e!220314))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!359637 (= res!199907 (not (= (select (arr!9523 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!359638 () Bool)

(declare-fun res!199909 () Bool)

(assert (=> b!359638 (=> (not res!199909) (not e!220314))))

(declare-fun arrayContainsKey!0 (array!20060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359638 (= res!199909 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!359639 () Bool)

(declare-fun res!199908 () Bool)

(assert (=> b!359639 (=> (not res!199908) (not e!220314))))

(assert (=> b!359639 (= res!199908 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9875 _keys!1456))))))

(declare-fun b!359640 () Bool)

(declare-fun res!199910 () Bool)

(assert (=> b!359640 (=> (not res!199910) (not e!220314))))

(declare-datatypes ((List!5385 0))(
  ( (Nil!5382) (Cons!5381 (h!6237 (_ BitVec 64)) (t!10527 List!5385)) )
))
(declare-fun arrayNoDuplicates!0 (array!20060 (_ BitVec 32) List!5385) Bool)

(assert (=> b!359640 (= res!199910 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5382))))

(declare-fun b!359641 () Bool)

(declare-fun tp_is_empty!8263 () Bool)

(assert (=> b!359641 (= e!220318 tp_is_empty!8263)))

(declare-fun b!359642 () Bool)

(declare-fun e!220316 () Bool)

(assert (=> b!359642 (= e!220316 tp_is_empty!8263)))

(declare-fun res!199912 () Bool)

(assert (=> start!35796 (=> (not res!199912) (not e!220314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35796 (= res!199912 (validMask!0 mask!1842))))

(assert (=> start!35796 e!220314))

(assert (=> start!35796 tp_is_empty!8263))

(assert (=> start!35796 true))

(declare-fun array_inv!7042 (array!20060) Bool)

(assert (=> start!35796 (array_inv!7042 _keys!1456)))

(declare-fun array_inv!7043 (array!20062) Bool)

(assert (=> start!35796 (and (array_inv!7043 _values!1208) e!220315)))

(declare-fun mapIsEmpty!13902 () Bool)

(assert (=> mapIsEmpty!13902 mapRes!13902))

(declare-fun b!359643 () Bool)

(assert (=> b!359643 (= e!220314 (not true))))

(assert (=> b!359643 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!11039 0))(
  ( (Unit!11040) )
))
(declare-fun lt!166400 () Unit!11039)

(declare-fun minValue!1150 () V!11995)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11995)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!41 (array!20060 array!20062 (_ BitVec 32) (_ BitVec 32) V!11995 V!11995 (_ BitVec 64) (_ BitVec 32)) Unit!11039)

(assert (=> b!359643 (= lt!166400 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!41 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13902 () Bool)

(declare-fun tp!27969 () Bool)

(assert (=> mapNonEmpty!13902 (= mapRes!13902 (and tp!27969 e!220316))))

(declare-fun mapKey!13902 () (_ BitVec 32))

(declare-fun mapValue!13902 () ValueCell!3788)

(declare-fun mapRest!13902 () (Array (_ BitVec 32) ValueCell!3788))

(assert (=> mapNonEmpty!13902 (= (arr!9524 _values!1208) (store mapRest!13902 mapKey!13902 mapValue!13902))))

(declare-fun b!359644 () Bool)

(declare-fun res!199906 () Bool)

(assert (=> b!359644 (=> (not res!199906) (not e!220314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359644 (= res!199906 (validKeyInArray!0 k0!1077))))

(declare-fun b!359645 () Bool)

(declare-fun res!199911 () Bool)

(assert (=> b!359645 (=> (not res!199911) (not e!220314))))

(assert (=> b!359645 (= res!199911 (and (= (size!9876 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9875 _keys!1456) (size!9876 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35796 res!199912) b!359645))

(assert (= (and b!359645 res!199911) b!359635))

(assert (= (and b!359635 res!199905) b!359640))

(assert (= (and b!359640 res!199910) b!359644))

(assert (= (and b!359644 res!199906) b!359639))

(assert (= (and b!359639 res!199908) b!359638))

(assert (= (and b!359638 res!199909) b!359637))

(assert (= (and b!359637 res!199907) b!359643))

(assert (= (and b!359636 condMapEmpty!13902) mapIsEmpty!13902))

(assert (= (and b!359636 (not condMapEmpty!13902)) mapNonEmpty!13902))

(get-info :version)

(assert (= (and mapNonEmpty!13902 ((_ is ValueCellFull!3788) mapValue!13902)) b!359642))

(assert (= (and b!359636 ((_ is ValueCellFull!3788) mapDefault!13902)) b!359641))

(assert (= start!35796 b!359636))

(declare-fun m!357327 () Bool)

(assert (=> b!359643 m!357327))

(declare-fun m!357329 () Bool)

(assert (=> b!359643 m!357329))

(declare-fun m!357331 () Bool)

(assert (=> b!359640 m!357331))

(declare-fun m!357333 () Bool)

(assert (=> b!359637 m!357333))

(declare-fun m!357335 () Bool)

(assert (=> b!359644 m!357335))

(declare-fun m!357337 () Bool)

(assert (=> b!359635 m!357337))

(declare-fun m!357339 () Bool)

(assert (=> mapNonEmpty!13902 m!357339))

(declare-fun m!357341 () Bool)

(assert (=> start!35796 m!357341))

(declare-fun m!357343 () Bool)

(assert (=> start!35796 m!357343))

(declare-fun m!357345 () Bool)

(assert (=> start!35796 m!357345))

(declare-fun m!357347 () Bool)

(assert (=> b!359638 m!357347))

(check-sat tp_is_empty!8263 (not start!35796) (not mapNonEmpty!13902) (not b!359644) (not b!359643) (not b!359638) (not b!359640) (not b!359635))
(check-sat)
