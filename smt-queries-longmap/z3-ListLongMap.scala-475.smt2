; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9588 () Bool)

(assert start!9588)

(declare-fun b!70507 () Bool)

(declare-fun b_free!2089 () Bool)

(declare-fun b_next!2089 () Bool)

(assert (=> b!70507 (= b_free!2089 (not b_next!2089))))

(declare-fun tp!8437 () Bool)

(declare-fun b_and!4329 () Bool)

(assert (=> b!70507 (= tp!8437 b_and!4329)))

(declare-fun b!70495 () Bool)

(declare-fun b_free!2091 () Bool)

(declare-fun b_next!2091 () Bool)

(assert (=> b!70495 (= b_free!2091 (not b_next!2091))))

(declare-fun tp!8435 () Bool)

(declare-fun b_and!4331 () Bool)

(assert (=> b!70495 (= tp!8435 b_and!4331)))

(declare-fun mapNonEmpty!3121 () Bool)

(declare-fun mapRes!3121 () Bool)

(declare-fun tp!8438 () Bool)

(declare-fun e!46133 () Bool)

(assert (=> mapNonEmpty!3121 (= mapRes!3121 (and tp!8438 e!46133))))

(declare-datatypes ((V!2929 0))(
  ( (V!2930 (val!1275 Int)) )
))
(declare-datatypes ((array!3851 0))(
  ( (array!3852 (arr!1838 (Array (_ BitVec 32) (_ BitVec 64))) (size!2075 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!887 0))(
  ( (ValueCellFull!887 (v!2509 V!2929)) (EmptyCell!887) )
))
(declare-datatypes ((array!3853 0))(
  ( (array!3854 (arr!1839 (Array (_ BitVec 32) ValueCell!887)) (size!2076 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!682 0))(
  ( (LongMapFixedSize!683 (defaultEntry!2188 Int) (mask!6143 (_ BitVec 32)) (extraKeys!2051 (_ BitVec 32)) (zeroValue!2092 V!2929) (minValue!2092 V!2929) (_size!390 (_ BitVec 32)) (_keys!3836 array!3851) (_values!2171 array!3853) (_vacant!390 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!490 0))(
  ( (Cell!491 (v!2510 LongMapFixedSize!682)) )
))
(declare-datatypes ((LongMap!490 0))(
  ( (LongMap!491 (underlying!256 Cell!490)) )
))
(declare-fun thiss!992 () LongMap!490)

(declare-fun mapRest!3121 () (Array (_ BitVec 32) ValueCell!887))

(declare-fun mapKey!3122 () (_ BitVec 32))

(declare-fun mapValue!3121 () ValueCell!887)

(assert (=> mapNonEmpty!3121 (= (arr!1839 (_values!2171 (v!2510 (underlying!256 thiss!992)))) (store mapRest!3121 mapKey!3122 mapValue!3121))))

(declare-fun b!70492 () Bool)

(declare-fun e!46131 () Bool)

(declare-fun e!46128 () Bool)

(assert (=> b!70492 (= e!46131 e!46128)))

(declare-fun res!37699 () Bool)

(assert (=> b!70492 (=> (not res!37699) (not e!46128))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!70492 (= res!37699 (and (not (= (select (arr!1838 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1838 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!31111 () V!2929)

(declare-fun get!1137 (ValueCell!887 V!2929) V!2929)

(declare-fun dynLambda!324 (Int (_ BitVec 64)) V!2929)

(assert (=> b!70492 (= lt!31111 (get!1137 (select (arr!1839 (_values!2171 (v!2510 (underlying!256 thiss!992)))) from!355) (dynLambda!324 (defaultEntry!2188 (v!2510 (underlying!256 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!70493 () Bool)

(declare-fun e!46123 () Bool)

(assert (=> b!70493 (= e!46123 e!46131)))

(declare-fun res!37700 () Bool)

(assert (=> b!70493 (=> (not res!37700) (not e!46131))))

(declare-datatypes ((tuple2!2100 0))(
  ( (tuple2!2101 (_1!1061 (_ BitVec 64)) (_2!1061 V!2929)) )
))
(declare-datatypes ((List!1463 0))(
  ( (Nil!1460) (Cons!1459 (h!2045 tuple2!2100) (t!4979 List!1463)) )
))
(declare-datatypes ((ListLongMap!1389 0))(
  ( (ListLongMap!1390 (toList!710 List!1463)) )
))
(declare-fun lt!31109 () ListLongMap!1389)

(declare-fun lt!31115 () ListLongMap!1389)

(assert (=> b!70493 (= res!37700 (= lt!31109 lt!31115))))

(declare-fun newMap!16 () LongMapFixedSize!682)

(declare-fun map!1150 (LongMapFixedSize!682) ListLongMap!1389)

(assert (=> b!70493 (= lt!31115 (map!1150 newMap!16))))

(declare-fun getCurrentListMap!408 (array!3851 array!3853 (_ BitVec 32) (_ BitVec 32) V!2929 V!2929 (_ BitVec 32) Int) ListLongMap!1389)

(assert (=> b!70493 (= lt!31109 (getCurrentListMap!408 (_keys!3836 (v!2510 (underlying!256 thiss!992))) (_values!2171 (v!2510 (underlying!256 thiss!992))) (mask!6143 (v!2510 (underlying!256 thiss!992))) (extraKeys!2051 (v!2510 (underlying!256 thiss!992))) (zeroValue!2092 (v!2510 (underlying!256 thiss!992))) (minValue!2092 (v!2510 (underlying!256 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2188 (v!2510 (underlying!256 thiss!992)))))))

(declare-fun b!70494 () Bool)

(declare-fun e!46134 () Bool)

(declare-fun tp_is_empty!2461 () Bool)

(assert (=> b!70494 (= e!46134 tp_is_empty!2461)))

(declare-fun e!46129 () Bool)

(declare-fun e!46120 () Bool)

(declare-fun array_inv!1131 (array!3851) Bool)

(declare-fun array_inv!1132 (array!3853) Bool)

(assert (=> b!70495 (= e!46120 (and tp!8435 tp_is_empty!2461 (array_inv!1131 (_keys!3836 newMap!16)) (array_inv!1132 (_values!2171 newMap!16)) e!46129))))

(declare-fun b!70496 () Bool)

(declare-fun res!37703 () Bool)

(assert (=> b!70496 (=> (not res!37703) (not e!46123))))

(assert (=> b!70496 (= res!37703 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6143 newMap!16)) (_size!390 (v!2510 (underlying!256 thiss!992)))))))

(declare-fun b!70497 () Bool)

(declare-fun res!37701 () Bool)

(assert (=> b!70497 (=> (not res!37701) (not e!46123))))

(assert (=> b!70497 (= res!37701 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2075 (_keys!3836 (v!2510 (underlying!256 thiss!992)))))))))

(declare-fun res!37702 () Bool)

(assert (=> start!9588 (=> (not res!37702) (not e!46123))))

(declare-fun valid!295 (LongMap!490) Bool)

(assert (=> start!9588 (= res!37702 (valid!295 thiss!992))))

(assert (=> start!9588 e!46123))

(declare-fun e!46135 () Bool)

(assert (=> start!9588 e!46135))

(assert (=> start!9588 true))

(assert (=> start!9588 e!46120))

(declare-fun b!70498 () Bool)

(declare-datatypes ((Unit!1987 0))(
  ( (Unit!1988) )
))
(declare-fun e!46124 () Unit!1987)

(declare-fun Unit!1989 () Unit!1987)

(assert (=> b!70498 (= e!46124 Unit!1989)))

(declare-fun lt!31112 () Unit!1987)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!40 (array!3851 array!3853 (_ BitVec 32) (_ BitVec 32) V!2929 V!2929 (_ BitVec 64) (_ BitVec 32) Int) Unit!1987)

(assert (=> b!70498 (= lt!31112 (lemmaListMapContainsThenArrayContainsFrom!40 (_keys!3836 (v!2510 (underlying!256 thiss!992))) (_values!2171 (v!2510 (underlying!256 thiss!992))) (mask!6143 (v!2510 (underlying!256 thiss!992))) (extraKeys!2051 (v!2510 (underlying!256 thiss!992))) (zeroValue!2092 (v!2510 (underlying!256 thiss!992))) (minValue!2092 (v!2510 (underlying!256 thiss!992))) (select (arr!1838 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2188 (v!2510 (underlying!256 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!70498 (arrayContainsKey!0 (_keys!3836 (v!2510 (underlying!256 thiss!992))) (select (arr!1838 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!31118 () Unit!1987)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3851 (_ BitVec 32) (_ BitVec 32)) Unit!1987)

(assert (=> b!70498 (= lt!31118 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3836 (v!2510 (underlying!256 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1464 0))(
  ( (Nil!1461) (Cons!1460 (h!2046 (_ BitVec 64)) (t!4980 List!1464)) )
))
(declare-fun arrayNoDuplicates!0 (array!3851 (_ BitVec 32) List!1464) Bool)

(assert (=> b!70498 (arrayNoDuplicates!0 (_keys!3836 (v!2510 (underlying!256 thiss!992))) from!355 Nil!1461)))

(declare-fun lt!31116 () Unit!1987)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3851 (_ BitVec 32) (_ BitVec 64) List!1464) Unit!1987)

(assert (=> b!70498 (= lt!31116 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3836 (v!2510 (underlying!256 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1838 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) from!355) (Cons!1460 (select (arr!1838 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) from!355) Nil!1461)))))

(assert (=> b!70498 false))

(declare-fun b!70499 () Bool)

(declare-fun e!46136 () Bool)

(assert (=> b!70499 (= e!46135 e!46136)))

(declare-fun b!70500 () Bool)

(declare-fun Unit!1990 () Unit!1987)

(assert (=> b!70500 (= e!46124 Unit!1990)))

(declare-fun b!70501 () Bool)

(declare-fun e!46127 () Bool)

(declare-fun e!46130 () Bool)

(assert (=> b!70501 (= e!46127 (and e!46130 mapRes!3121))))

(declare-fun condMapEmpty!3122 () Bool)

(declare-fun mapDefault!3122 () ValueCell!887)

(assert (=> b!70501 (= condMapEmpty!3122 (= (arr!1839 (_values!2171 (v!2510 (underlying!256 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!887)) mapDefault!3122)))))

(declare-fun b!70502 () Bool)

(declare-fun e!46122 () Bool)

(assert (=> b!70502 (= e!46122 tp_is_empty!2461)))

(declare-fun mapNonEmpty!3122 () Bool)

(declare-fun mapRes!3122 () Bool)

(declare-fun tp!8436 () Bool)

(assert (=> mapNonEmpty!3122 (= mapRes!3122 (and tp!8436 e!46134))))

(declare-fun mapRest!3122 () (Array (_ BitVec 32) ValueCell!887))

(declare-fun mapKey!3121 () (_ BitVec 32))

(declare-fun mapValue!3122 () ValueCell!887)

(assert (=> mapNonEmpty!3122 (= (arr!1839 (_values!2171 newMap!16)) (store mapRest!3122 mapKey!3121 mapValue!3122))))

(declare-fun b!70503 () Bool)

(assert (=> b!70503 (= e!46129 (and e!46122 mapRes!3122))))

(declare-fun condMapEmpty!3121 () Bool)

(declare-fun mapDefault!3121 () ValueCell!887)

(assert (=> b!70503 (= condMapEmpty!3121 (= (arr!1839 (_values!2171 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!887)) mapDefault!3121)))))

(declare-fun b!70504 () Bool)

(declare-fun e!46132 () Bool)

(declare-fun e!46121 () Bool)

(assert (=> b!70504 (= e!46132 (not e!46121))))

(declare-fun res!37705 () Bool)

(assert (=> b!70504 (=> res!37705 e!46121)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!70504 (= res!37705 (not (validMask!0 (mask!6143 (v!2510 (underlying!256 thiss!992))))))))

(declare-fun lt!31119 () ListLongMap!1389)

(declare-fun lt!31113 () tuple2!2100)

(declare-fun lt!31120 () tuple2!2100)

(declare-fun +!89 (ListLongMap!1389 tuple2!2100) ListLongMap!1389)

(assert (=> b!70504 (= (+!89 (+!89 lt!31119 lt!31113) lt!31120) (+!89 (+!89 lt!31119 lt!31120) lt!31113))))

(assert (=> b!70504 (= lt!31120 (tuple2!2101 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2092 (v!2510 (underlying!256 thiss!992)))))))

(assert (=> b!70504 (= lt!31113 (tuple2!2101 (select (arr!1838 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) from!355) lt!31111))))

(declare-fun lt!31110 () Unit!1987)

(declare-fun addCommutativeForDiffKeys!9 (ListLongMap!1389 (_ BitVec 64) V!2929 (_ BitVec 64) V!2929) Unit!1987)

(assert (=> b!70504 (= lt!31110 (addCommutativeForDiffKeys!9 lt!31119 (select (arr!1838 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) from!355) lt!31111 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2092 (v!2510 (underlying!256 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!54 (array!3851 array!3853 (_ BitVec 32) (_ BitVec 32) V!2929 V!2929 (_ BitVec 32) Int) ListLongMap!1389)

(assert (=> b!70504 (= lt!31119 (getCurrentListMapNoExtraKeys!54 (_keys!3836 (v!2510 (underlying!256 thiss!992))) (_values!2171 (v!2510 (underlying!256 thiss!992))) (mask!6143 (v!2510 (underlying!256 thiss!992))) (extraKeys!2051 (v!2510 (underlying!256 thiss!992))) (zeroValue!2092 (v!2510 (underlying!256 thiss!992))) (minValue!2092 (v!2510 (underlying!256 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2188 (v!2510 (underlying!256 thiss!992)))))))

(declare-fun mapIsEmpty!3121 () Bool)

(assert (=> mapIsEmpty!3121 mapRes!3121))

(declare-fun mapIsEmpty!3122 () Bool)

(assert (=> mapIsEmpty!3122 mapRes!3122))

(declare-fun b!70505 () Bool)

(declare-fun res!37706 () Bool)

(assert (=> b!70505 (=> (not res!37706) (not e!46123))))

(declare-fun valid!296 (LongMapFixedSize!682) Bool)

(assert (=> b!70505 (= res!37706 (valid!296 newMap!16))))

(declare-fun b!70506 () Bool)

(assert (=> b!70506 (= e!46128 e!46132)))

(declare-fun res!37704 () Bool)

(assert (=> b!70506 (=> (not res!37704) (not e!46132))))

(declare-datatypes ((tuple2!2102 0))(
  ( (tuple2!2103 (_1!1062 Bool) (_2!1062 LongMapFixedSize!682)) )
))
(declare-fun lt!31114 () tuple2!2102)

(assert (=> b!70506 (= res!37704 (and (_1!1062 lt!31114) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!31117 () Unit!1987)

(assert (=> b!70506 (= lt!31117 e!46124)))

(declare-fun c!10222 () Bool)

(declare-fun contains!714 (ListLongMap!1389 (_ BitVec 64)) Bool)

(assert (=> b!70506 (= c!10222 (contains!714 lt!31115 (select (arr!1838 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) from!355)))))

(declare-fun update!106 (LongMapFixedSize!682 (_ BitVec 64) V!2929) tuple2!2102)

(assert (=> b!70506 (= lt!31114 (update!106 newMap!16 (select (arr!1838 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) from!355) lt!31111))))

(declare-fun e!46137 () Bool)

(assert (=> b!70507 (= e!46137 (and tp!8437 tp_is_empty!2461 (array_inv!1131 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) (array_inv!1132 (_values!2171 (v!2510 (underlying!256 thiss!992)))) e!46127))))

(declare-fun b!70508 () Bool)

(assert (=> b!70508 (= e!46136 e!46137)))

(declare-fun b!70509 () Bool)

(assert (=> b!70509 (= e!46133 tp_is_empty!2461)))

(declare-fun b!70510 () Bool)

(assert (=> b!70510 (= e!46121 (or (not (= (size!2076 (_values!2171 (v!2510 (underlying!256 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6143 (v!2510 (underlying!256 thiss!992)))))) (not (= (size!2075 (_keys!3836 (v!2510 (underlying!256 thiss!992)))) (size!2076 (_values!2171 (v!2510 (underlying!256 thiss!992)))))) (bvsge (mask!6143 (v!2510 (underlying!256 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!70511 () Bool)

(assert (=> b!70511 (= e!46130 tp_is_empty!2461)))

(assert (= (and start!9588 res!37702) b!70497))

(assert (= (and b!70497 res!37701) b!70505))

(assert (= (and b!70505 res!37706) b!70496))

(assert (= (and b!70496 res!37703) b!70493))

(assert (= (and b!70493 res!37700) b!70492))

(assert (= (and b!70492 res!37699) b!70506))

(assert (= (and b!70506 c!10222) b!70498))

(assert (= (and b!70506 (not c!10222)) b!70500))

(assert (= (and b!70506 res!37704) b!70504))

(assert (= (and b!70504 (not res!37705)) b!70510))

(assert (= (and b!70501 condMapEmpty!3122) mapIsEmpty!3121))

(assert (= (and b!70501 (not condMapEmpty!3122)) mapNonEmpty!3121))

(get-info :version)

(assert (= (and mapNonEmpty!3121 ((_ is ValueCellFull!887) mapValue!3121)) b!70509))

(assert (= (and b!70501 ((_ is ValueCellFull!887) mapDefault!3122)) b!70511))

(assert (= b!70507 b!70501))

(assert (= b!70508 b!70507))

(assert (= b!70499 b!70508))

(assert (= start!9588 b!70499))

(assert (= (and b!70503 condMapEmpty!3121) mapIsEmpty!3122))

(assert (= (and b!70503 (not condMapEmpty!3121)) mapNonEmpty!3122))

(assert (= (and mapNonEmpty!3122 ((_ is ValueCellFull!887) mapValue!3122)) b!70494))

(assert (= (and b!70503 ((_ is ValueCellFull!887) mapDefault!3121)) b!70502))

(assert (= b!70495 b!70503))

(assert (= start!9588 b!70495))

(declare-fun b_lambda!3175 () Bool)

(assert (=> (not b_lambda!3175) (not b!70492)))

(declare-fun t!4976 () Bool)

(declare-fun tb!1489 () Bool)

(assert (=> (and b!70507 (= (defaultEntry!2188 (v!2510 (underlying!256 thiss!992))) (defaultEntry!2188 (v!2510 (underlying!256 thiss!992)))) t!4976) tb!1489))

(declare-fun result!2623 () Bool)

(assert (=> tb!1489 (= result!2623 tp_is_empty!2461)))

(assert (=> b!70492 t!4976))

(declare-fun b_and!4333 () Bool)

(assert (= b_and!4329 (and (=> t!4976 result!2623) b_and!4333)))

(declare-fun t!4978 () Bool)

(declare-fun tb!1491 () Bool)

(assert (=> (and b!70495 (= (defaultEntry!2188 newMap!16) (defaultEntry!2188 (v!2510 (underlying!256 thiss!992)))) t!4978) tb!1491))

(declare-fun result!2627 () Bool)

(assert (= result!2627 result!2623))

(assert (=> b!70492 t!4978))

(declare-fun b_and!4335 () Bool)

(assert (= b_and!4331 (and (=> t!4978 result!2627) b_and!4335)))

(declare-fun m!67651 () Bool)

(assert (=> b!70505 m!67651))

(declare-fun m!67653 () Bool)

(assert (=> b!70498 m!67653))

(declare-fun m!67655 () Bool)

(assert (=> b!70498 m!67655))

(declare-fun m!67657 () Bool)

(assert (=> b!70498 m!67657))

(declare-fun m!67659 () Bool)

(assert (=> b!70498 m!67659))

(assert (=> b!70498 m!67657))

(assert (=> b!70498 m!67657))

(declare-fun m!67661 () Bool)

(assert (=> b!70498 m!67661))

(assert (=> b!70498 m!67657))

(declare-fun m!67663 () Bool)

(assert (=> b!70498 m!67663))

(declare-fun m!67665 () Bool)

(assert (=> mapNonEmpty!3121 m!67665))

(declare-fun m!67667 () Bool)

(assert (=> start!9588 m!67667))

(declare-fun m!67669 () Bool)

(assert (=> b!70507 m!67669))

(declare-fun m!67671 () Bool)

(assert (=> b!70507 m!67671))

(assert (=> b!70506 m!67657))

(assert (=> b!70506 m!67657))

(declare-fun m!67673 () Bool)

(assert (=> b!70506 m!67673))

(assert (=> b!70506 m!67657))

(declare-fun m!67675 () Bool)

(assert (=> b!70506 m!67675))

(declare-fun m!67677 () Bool)

(assert (=> b!70504 m!67677))

(declare-fun m!67679 () Bool)

(assert (=> b!70504 m!67679))

(declare-fun m!67681 () Bool)

(assert (=> b!70504 m!67681))

(declare-fun m!67683 () Bool)

(assert (=> b!70504 m!67683))

(assert (=> b!70504 m!67657))

(assert (=> b!70504 m!67677))

(assert (=> b!70504 m!67683))

(declare-fun m!67685 () Bool)

(assert (=> b!70504 m!67685))

(assert (=> b!70504 m!67657))

(declare-fun m!67687 () Bool)

(assert (=> b!70504 m!67687))

(declare-fun m!67689 () Bool)

(assert (=> b!70504 m!67689))

(assert (=> b!70492 m!67657))

(declare-fun m!67691 () Bool)

(assert (=> b!70492 m!67691))

(declare-fun m!67693 () Bool)

(assert (=> b!70492 m!67693))

(assert (=> b!70492 m!67691))

(assert (=> b!70492 m!67693))

(declare-fun m!67695 () Bool)

(assert (=> b!70492 m!67695))

(declare-fun m!67697 () Bool)

(assert (=> b!70495 m!67697))

(declare-fun m!67699 () Bool)

(assert (=> b!70495 m!67699))

(declare-fun m!67701 () Bool)

(assert (=> b!70493 m!67701))

(declare-fun m!67703 () Bool)

(assert (=> b!70493 m!67703))

(declare-fun m!67705 () Bool)

(assert (=> mapNonEmpty!3122 m!67705))

(check-sat (not b_next!2089) b_and!4333 (not b!70498) (not mapNonEmpty!3122) (not b!70504) b_and!4335 (not b!70505) (not b!70507) (not mapNonEmpty!3121) (not b!70506) tp_is_empty!2461 (not b!70495) (not b_next!2091) (not b_lambda!3175) (not b!70492) (not b!70493) (not start!9588))
(check-sat b_and!4333 b_and!4335 (not b_next!2089) (not b_next!2091))
