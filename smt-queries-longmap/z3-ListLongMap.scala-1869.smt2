; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33650 () Bool)

(assert start!33650)

(declare-fun b_free!6885 () Bool)

(declare-fun b_next!6885 () Bool)

(assert (=> start!33650 (= b_free!6885 (not b_next!6885))))

(declare-fun tp!24159 () Bool)

(declare-fun b_and!14065 () Bool)

(assert (=> start!33650 (= tp!24159 b_and!14065)))

(declare-fun b!334107 () Bool)

(declare-fun res!184132 () Bool)

(declare-fun e!205114 () Bool)

(assert (=> b!334107 (=> (not res!184132) (not e!205114))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334107 (= res!184132 (validKeyInArray!0 k0!1348))))

(declare-fun res!184138 () Bool)

(assert (=> start!33650 (=> (not res!184138) (not e!205114))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33650 (= res!184138 (validMask!0 mask!2385))))

(assert (=> start!33650 e!205114))

(assert (=> start!33650 true))

(declare-fun tp_is_empty!6837 () Bool)

(assert (=> start!33650 tp_is_empty!6837))

(assert (=> start!33650 tp!24159))

(declare-datatypes ((V!10093 0))(
  ( (V!10094 (val!3463 Int)) )
))
(declare-datatypes ((ValueCell!3075 0))(
  ( (ValueCellFull!3075 (v!5625 V!10093)) (EmptyCell!3075) )
))
(declare-datatypes ((array!17267 0))(
  ( (array!17268 (arr!8164 (Array (_ BitVec 32) ValueCell!3075)) (size!8516 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17267)

(declare-fun e!205116 () Bool)

(declare-fun array_inv!6070 (array!17267) Bool)

(assert (=> start!33650 (and (array_inv!6070 _values!1525) e!205116)))

(declare-datatypes ((array!17269 0))(
  ( (array!17270 (arr!8165 (Array (_ BitVec 32) (_ BitVec 64))) (size!8517 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17269)

(declare-fun array_inv!6071 (array!17269) Bool)

(assert (=> start!33650 (array_inv!6071 _keys!1895)))

(declare-fun b!334108 () Bool)

(declare-fun res!184139 () Bool)

(assert (=> b!334108 (=> (not res!184139) (not e!205114))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334108 (= res!184139 (and (= (size!8516 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8517 _keys!1895) (size!8516 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334109 () Bool)

(declare-fun res!184137 () Bool)

(assert (=> b!334109 (=> (not res!184137) (not e!205114))))

(declare-datatypes ((List!4650 0))(
  ( (Nil!4647) (Cons!4646 (h!5502 (_ BitVec 64)) (t!9738 List!4650)) )
))
(declare-fun arrayNoDuplicates!0 (array!17269 (_ BitVec 32) List!4650) Bool)

(assert (=> b!334109 (= res!184137 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4647))))

(declare-fun b!334110 () Bool)

(declare-fun e!205115 () Bool)

(assert (=> b!334110 (= e!205115 (not true))))

(declare-fun arrayContainsKey!0 (array!17269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334110 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10387 0))(
  ( (Unit!10388) )
))
(declare-fun lt!159463 () Unit!10387)

(declare-datatypes ((SeekEntryResult!3154 0))(
  ( (MissingZero!3154 (index!14795 (_ BitVec 32))) (Found!3154 (index!14796 (_ BitVec 32))) (Intermediate!3154 (undefined!3966 Bool) (index!14797 (_ BitVec 32)) (x!33288 (_ BitVec 32))) (Undefined!3154) (MissingVacant!3154 (index!14798 (_ BitVec 32))) )
))
(declare-fun lt!159462 () SeekEntryResult!3154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17269 (_ BitVec 64) (_ BitVec 32)) Unit!10387)

(assert (=> b!334110 (= lt!159463 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14796 lt!159462)))))

(declare-fun b!334111 () Bool)

(declare-fun e!205118 () Bool)

(assert (=> b!334111 (= e!205118 tp_is_empty!6837)))

(declare-fun b!334112 () Bool)

(declare-fun res!184133 () Bool)

(assert (=> b!334112 (=> (not res!184133) (not e!205114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17269 (_ BitVec 32)) Bool)

(assert (=> b!334112 (= res!184133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334113 () Bool)

(declare-fun e!205119 () Bool)

(declare-fun mapRes!11652 () Bool)

(assert (=> b!334113 (= e!205116 (and e!205119 mapRes!11652))))

(declare-fun condMapEmpty!11652 () Bool)

(declare-fun mapDefault!11652 () ValueCell!3075)

(assert (=> b!334113 (= condMapEmpty!11652 (= (arr!8164 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3075)) mapDefault!11652)))))

(declare-fun mapNonEmpty!11652 () Bool)

(declare-fun tp!24158 () Bool)

(assert (=> mapNonEmpty!11652 (= mapRes!11652 (and tp!24158 e!205118))))

(declare-fun mapRest!11652 () (Array (_ BitVec 32) ValueCell!3075))

(declare-fun mapKey!11652 () (_ BitVec 32))

(declare-fun mapValue!11652 () ValueCell!3075)

(assert (=> mapNonEmpty!11652 (= (arr!8164 _values!1525) (store mapRest!11652 mapKey!11652 mapValue!11652))))

(declare-fun b!334114 () Bool)

(declare-fun res!184135 () Bool)

(assert (=> b!334114 (=> (not res!184135) (not e!205115))))

(assert (=> b!334114 (= res!184135 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14796 lt!159462)))))

(declare-fun mapIsEmpty!11652 () Bool)

(assert (=> mapIsEmpty!11652 mapRes!11652))

(declare-fun b!334115 () Bool)

(declare-fun res!184136 () Bool)

(assert (=> b!334115 (=> (not res!184136) (not e!205114))))

(declare-fun zeroValue!1467 () V!10093)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10093)

(declare-datatypes ((tuple2!5030 0))(
  ( (tuple2!5031 (_1!2526 (_ BitVec 64)) (_2!2526 V!10093)) )
))
(declare-datatypes ((List!4651 0))(
  ( (Nil!4648) (Cons!4647 (h!5503 tuple2!5030) (t!9739 List!4651)) )
))
(declare-datatypes ((ListLongMap!3943 0))(
  ( (ListLongMap!3944 (toList!1987 List!4651)) )
))
(declare-fun contains!2031 (ListLongMap!3943 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1515 (array!17269 array!17267 (_ BitVec 32) (_ BitVec 32) V!10093 V!10093 (_ BitVec 32) Int) ListLongMap!3943)

(assert (=> b!334115 (= res!184136 (not (contains!2031 (getCurrentListMap!1515 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334116 () Bool)

(assert (=> b!334116 (= e!205114 e!205115)))

(declare-fun res!184134 () Bool)

(assert (=> b!334116 (=> (not res!184134) (not e!205115))))

(get-info :version)

(assert (=> b!334116 (= res!184134 (and ((_ is Found!3154) lt!159462) (= (select (arr!8165 _keys!1895) (index!14796 lt!159462)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17269 (_ BitVec 32)) SeekEntryResult!3154)

(assert (=> b!334116 (= lt!159462 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334117 () Bool)

(assert (=> b!334117 (= e!205119 tp_is_empty!6837)))

(assert (= (and start!33650 res!184138) b!334108))

(assert (= (and b!334108 res!184139) b!334112))

(assert (= (and b!334112 res!184133) b!334109))

(assert (= (and b!334109 res!184137) b!334107))

(assert (= (and b!334107 res!184132) b!334115))

(assert (= (and b!334115 res!184136) b!334116))

(assert (= (and b!334116 res!184134) b!334114))

(assert (= (and b!334114 res!184135) b!334110))

(assert (= (and b!334113 condMapEmpty!11652) mapIsEmpty!11652))

(assert (= (and b!334113 (not condMapEmpty!11652)) mapNonEmpty!11652))

(assert (= (and mapNonEmpty!11652 ((_ is ValueCellFull!3075) mapValue!11652)) b!334111))

(assert (= (and b!334113 ((_ is ValueCellFull!3075) mapDefault!11652)) b!334117))

(assert (= start!33650 b!334113))

(declare-fun m!338221 () Bool)

(assert (=> b!334110 m!338221))

(declare-fun m!338223 () Bool)

(assert (=> b!334110 m!338223))

(declare-fun m!338225 () Bool)

(assert (=> b!334109 m!338225))

(declare-fun m!338227 () Bool)

(assert (=> b!334114 m!338227))

(declare-fun m!338229 () Bool)

(assert (=> mapNonEmpty!11652 m!338229))

(declare-fun m!338231 () Bool)

(assert (=> start!33650 m!338231))

(declare-fun m!338233 () Bool)

(assert (=> start!33650 m!338233))

(declare-fun m!338235 () Bool)

(assert (=> start!33650 m!338235))

(declare-fun m!338237 () Bool)

(assert (=> b!334115 m!338237))

(assert (=> b!334115 m!338237))

(declare-fun m!338239 () Bool)

(assert (=> b!334115 m!338239))

(declare-fun m!338241 () Bool)

(assert (=> b!334107 m!338241))

(declare-fun m!338243 () Bool)

(assert (=> b!334112 m!338243))

(declare-fun m!338245 () Bool)

(assert (=> b!334116 m!338245))

(declare-fun m!338247 () Bool)

(assert (=> b!334116 m!338247))

(check-sat b_and!14065 tp_is_empty!6837 (not b!334116) (not b!334110) (not b_next!6885) (not b!334109) (not start!33650) (not mapNonEmpty!11652) (not b!334107) (not b!334112) (not b!334114) (not b!334115))
(check-sat b_and!14065 (not b_next!6885))
