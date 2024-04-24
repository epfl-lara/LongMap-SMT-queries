; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84082 () Bool)

(assert start!84082)

(declare-fun b_free!19723 () Bool)

(declare-fun b_next!19723 () Bool)

(assert (=> start!84082 (= b_free!19723 (not b_next!19723))))

(declare-fun tp!68612 () Bool)

(declare-fun b_and!31545 () Bool)

(assert (=> start!84082 (= tp!68612 b_and!31545)))

(declare-fun b!981599 () Bool)

(declare-fun res!656670 () Bool)

(declare-fun e!553343 () Bool)

(assert (=> b!981599 (=> (not res!656670) (not e!553343))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981599 (= res!656670 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!981600 () Bool)

(declare-fun res!656671 () Bool)

(assert (=> b!981600 (=> (not res!656671) (not e!553343))))

(declare-datatypes ((array!61472 0))(
  ( (array!61473 (arr!29589 (Array (_ BitVec 32) (_ BitVec 64))) (size!30069 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61472)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981600 (= res!656671 (validKeyInArray!0 (select (arr!29589 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36104 () Bool)

(declare-fun mapRes!36104 () Bool)

(assert (=> mapIsEmpty!36104 mapRes!36104))

(declare-fun mapNonEmpty!36104 () Bool)

(declare-fun tp!68611 () Bool)

(declare-fun e!553344 () Bool)

(assert (=> mapNonEmpty!36104 (= mapRes!36104 (and tp!68611 e!553344))))

(declare-datatypes ((V!35273 0))(
  ( (V!35274 (val!11409 Int)) )
))
(declare-datatypes ((ValueCell!10877 0))(
  ( (ValueCellFull!10877 (v!13968 V!35273)) (EmptyCell!10877) )
))
(declare-datatypes ((array!61474 0))(
  ( (array!61475 (arr!29590 (Array (_ BitVec 32) ValueCell!10877)) (size!30070 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61474)

(declare-fun mapValue!36104 () ValueCell!10877)

(declare-fun mapKey!36104 () (_ BitVec 32))

(declare-fun mapRest!36104 () (Array (_ BitVec 32) ValueCell!10877))

(assert (=> mapNonEmpty!36104 (= (arr!29590 _values!1278) (store mapRest!36104 mapKey!36104 mapValue!36104))))

(declare-fun b!981601 () Bool)

(declare-fun res!656673 () Bool)

(assert (=> b!981601 (=> (not res!656673) (not e!553343))))

(declare-datatypes ((List!20508 0))(
  ( (Nil!20505) (Cons!20504 (h!21672 (_ BitVec 64)) (t!29179 List!20508)) )
))
(declare-fun arrayNoDuplicates!0 (array!61472 (_ BitVec 32) List!20508) Bool)

(assert (=> b!981601 (= res!656673 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20505))))

(declare-fun b!981602 () Bool)

(declare-fun e!553342 () Bool)

(declare-fun e!553339 () Bool)

(assert (=> b!981602 (= e!553342 (and e!553339 mapRes!36104))))

(declare-fun condMapEmpty!36104 () Bool)

(declare-fun mapDefault!36104 () ValueCell!10877)

(assert (=> b!981602 (= condMapEmpty!36104 (= (arr!29590 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10877)) mapDefault!36104)))))

(declare-fun b!981604 () Bool)

(declare-fun res!656677 () Bool)

(assert (=> b!981604 (=> (not res!656677) (not e!553343))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61472 (_ BitVec 32)) Bool)

(assert (=> b!981604 (= res!656677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981605 () Bool)

(declare-fun tp_is_empty!22717 () Bool)

(assert (=> b!981605 (= e!553339 tp_is_empty!22717)))

(declare-fun b!981606 () Bool)

(declare-fun e!553341 () Bool)

(assert (=> b!981606 (= e!553341 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!14648 0))(
  ( (tuple2!14649 (_1!7335 (_ BitVec 64)) (_2!7335 V!35273)) )
))
(declare-fun lt!435897 () tuple2!14648)

(declare-datatypes ((List!20509 0))(
  ( (Nil!20506) (Cons!20505 (h!21673 tuple2!14648) (t!29180 List!20509)) )
))
(declare-datatypes ((ListLongMap!13347 0))(
  ( (ListLongMap!13348 (toList!6689 List!20509)) )
))
(declare-fun lt!435891 () ListLongMap!13347)

(declare-fun lt!435895 () tuple2!14648)

(declare-fun lt!435900 () ListLongMap!13347)

(declare-fun +!3004 (ListLongMap!13347 tuple2!14648) ListLongMap!13347)

(assert (=> b!981606 (= lt!435891 (+!3004 (+!3004 lt!435900 lt!435897) lt!435895))))

(declare-datatypes ((Unit!32588 0))(
  ( (Unit!32589) )
))
(declare-fun lt!435899 () Unit!32588)

(declare-fun lt!435896 () V!35273)

(declare-fun zeroValue!1220 () V!35273)

(declare-fun addCommutativeForDiffKeys!611 (ListLongMap!13347 (_ BitVec 64) V!35273 (_ BitVec 64) V!35273) Unit!32588)

(assert (=> b!981606 (= lt!435899 (addCommutativeForDiffKeys!611 lt!435900 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29589 _keys!1544) from!1932) lt!435896))))

(declare-fun b!981607 () Bool)

(declare-fun res!656676 () Bool)

(assert (=> b!981607 (=> (not res!656676) (not e!553343))))

(assert (=> b!981607 (= res!656676 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30069 _keys!1544))))))

(declare-fun b!981608 () Bool)

(declare-fun res!656672 () Bool)

(assert (=> b!981608 (=> (not res!656672) (not e!553343))))

(assert (=> b!981608 (= res!656672 (and (= (size!30070 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30069 _keys!1544) (size!30070 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981609 () Bool)

(assert (=> b!981609 (= e!553343 (not e!553341))))

(declare-fun res!656675 () Bool)

(assert (=> b!981609 (=> res!656675 e!553341)))

(assert (=> b!981609 (= res!656675 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29589 _keys!1544) from!1932)))))

(declare-fun lt!435892 () tuple2!14648)

(declare-fun lt!435898 () ListLongMap!13347)

(assert (=> b!981609 (= (+!3004 lt!435898 lt!435897) (+!3004 lt!435891 lt!435892))))

(declare-fun lt!435893 () ListLongMap!13347)

(assert (=> b!981609 (= lt!435891 (+!3004 lt!435893 lt!435897))))

(assert (=> b!981609 (= lt!435897 (tuple2!14649 (select (arr!29589 _keys!1544) from!1932) lt!435896))))

(assert (=> b!981609 (= lt!435898 (+!3004 lt!435893 lt!435892))))

(declare-fun minValue!1220 () V!35273)

(assert (=> b!981609 (= lt!435892 (tuple2!14649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435894 () Unit!32588)

(assert (=> b!981609 (= lt!435894 (addCommutativeForDiffKeys!611 lt!435893 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29589 _keys!1544) from!1932) lt!435896))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15368 (ValueCell!10877 V!35273) V!35273)

(declare-fun dynLambda!1797 (Int (_ BitVec 64)) V!35273)

(assert (=> b!981609 (= lt!435896 (get!15368 (select (arr!29590 _values!1278) from!1932) (dynLambda!1797 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!981609 (= lt!435893 (+!3004 lt!435900 lt!435895))))

(assert (=> b!981609 (= lt!435895 (tuple2!14649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3435 (array!61472 array!61474 (_ BitVec 32) (_ BitVec 32) V!35273 V!35273 (_ BitVec 32) Int) ListLongMap!13347)

(assert (=> b!981609 (= lt!435900 (getCurrentListMapNoExtraKeys!3435 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!656674 () Bool)

(assert (=> start!84082 (=> (not res!656674) (not e!553343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84082 (= res!656674 (validMask!0 mask!1948))))

(assert (=> start!84082 e!553343))

(assert (=> start!84082 true))

(assert (=> start!84082 tp_is_empty!22717))

(declare-fun array_inv!22905 (array!61474) Bool)

(assert (=> start!84082 (and (array_inv!22905 _values!1278) e!553342)))

(assert (=> start!84082 tp!68612))

(declare-fun array_inv!22906 (array!61472) Bool)

(assert (=> start!84082 (array_inv!22906 _keys!1544)))

(declare-fun b!981603 () Bool)

(assert (=> b!981603 (= e!553344 tp_is_empty!22717)))

(assert (= (and start!84082 res!656674) b!981608))

(assert (= (and b!981608 res!656672) b!981604))

(assert (= (and b!981604 res!656677) b!981601))

(assert (= (and b!981601 res!656673) b!981607))

(assert (= (and b!981607 res!656676) b!981600))

(assert (= (and b!981600 res!656671) b!981599))

(assert (= (and b!981599 res!656670) b!981609))

(assert (= (and b!981609 (not res!656675)) b!981606))

(assert (= (and b!981602 condMapEmpty!36104) mapIsEmpty!36104))

(assert (= (and b!981602 (not condMapEmpty!36104)) mapNonEmpty!36104))

(get-info :version)

(assert (= (and mapNonEmpty!36104 ((_ is ValueCellFull!10877) mapValue!36104)) b!981603))

(assert (= (and b!981602 ((_ is ValueCellFull!10877) mapDefault!36104)) b!981605))

(assert (= start!84082 b!981602))

(declare-fun b_lambda!14781 () Bool)

(assert (=> (not b_lambda!14781) (not b!981609)))

(declare-fun t!29178 () Bool)

(declare-fun tb!6521 () Bool)

(assert (=> (and start!84082 (= defaultEntry!1281 defaultEntry!1281) t!29178) tb!6521))

(declare-fun result!13039 () Bool)

(assert (=> tb!6521 (= result!13039 tp_is_empty!22717)))

(assert (=> b!981609 t!29178))

(declare-fun b_and!31547 () Bool)

(assert (= b_and!31545 (and (=> t!29178 result!13039) b_and!31547)))

(declare-fun m!909551 () Bool)

(assert (=> start!84082 m!909551))

(declare-fun m!909553 () Bool)

(assert (=> start!84082 m!909553))

(declare-fun m!909555 () Bool)

(assert (=> start!84082 m!909555))

(declare-fun m!909557 () Bool)

(assert (=> b!981600 m!909557))

(assert (=> b!981600 m!909557))

(declare-fun m!909559 () Bool)

(assert (=> b!981600 m!909559))

(declare-fun m!909561 () Bool)

(assert (=> b!981604 m!909561))

(declare-fun m!909563 () Bool)

(assert (=> mapNonEmpty!36104 m!909563))

(declare-fun m!909565 () Bool)

(assert (=> b!981606 m!909565))

(assert (=> b!981606 m!909565))

(declare-fun m!909567 () Bool)

(assert (=> b!981606 m!909567))

(assert (=> b!981606 m!909557))

(assert (=> b!981606 m!909557))

(declare-fun m!909569 () Bool)

(assert (=> b!981606 m!909569))

(declare-fun m!909571 () Bool)

(assert (=> b!981601 m!909571))

(declare-fun m!909573 () Bool)

(assert (=> b!981609 m!909573))

(declare-fun m!909575 () Bool)

(assert (=> b!981609 m!909575))

(declare-fun m!909577 () Bool)

(assert (=> b!981609 m!909577))

(declare-fun m!909579 () Bool)

(assert (=> b!981609 m!909579))

(declare-fun m!909581 () Bool)

(assert (=> b!981609 m!909581))

(declare-fun m!909583 () Bool)

(assert (=> b!981609 m!909583))

(assert (=> b!981609 m!909557))

(declare-fun m!909585 () Bool)

(assert (=> b!981609 m!909585))

(declare-fun m!909587 () Bool)

(assert (=> b!981609 m!909587))

(assert (=> b!981609 m!909557))

(declare-fun m!909589 () Bool)

(assert (=> b!981609 m!909589))

(assert (=> b!981609 m!909573))

(assert (=> b!981609 m!909589))

(declare-fun m!909591 () Bool)

(assert (=> b!981609 m!909591))

(check-sat b_and!31547 (not b!981604) (not b!981600) (not b!981601) (not b_lambda!14781) (not b!981609) tp_is_empty!22717 (not mapNonEmpty!36104) (not b!981606) (not start!84082) (not b_next!19723))
(check-sat b_and!31547 (not b_next!19723))
