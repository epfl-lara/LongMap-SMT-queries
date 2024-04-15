; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8376 () Bool)

(assert start!8376)

(declare-fun b!56221 () Bool)

(declare-fun b_free!1909 () Bool)

(declare-fun b_next!1909 () Bool)

(assert (=> b!56221 (= b_free!1909 (not b_next!1909))))

(declare-fun tp!7830 () Bool)

(declare-fun b_and!3361 () Bool)

(assert (=> b!56221 (= tp!7830 b_and!3361)))

(declare-fun b!56228 () Bool)

(declare-fun b_free!1911 () Bool)

(declare-fun b_next!1911 () Bool)

(assert (=> b!56228 (= b_free!1911 (not b_next!1911))))

(declare-fun tp!7829 () Bool)

(declare-fun b_and!3363 () Bool)

(assert (=> b!56228 (= tp!7829 b_and!3363)))

(declare-fun b!56214 () Bool)

(declare-fun e!37010 () Bool)

(assert (=> b!56214 (= e!37010 true)))

(declare-datatypes ((List!1418 0))(
  ( (Nil!1415) (Cons!1414 (h!1994 (_ BitVec 64)) (t!4695 List!1418)) )
))
(declare-fun lt!22198 () List!1418)

(declare-datatypes ((V!2809 0))(
  ( (V!2810 (val!1230 Int)) )
))
(declare-datatypes ((array!3645 0))(
  ( (array!3646 (arr!1744 (Array (_ BitVec 32) (_ BitVec 64))) (size!1974 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!842 0))(
  ( (ValueCellFull!842 (v!2340 V!2809)) (EmptyCell!842) )
))
(declare-datatypes ((array!3647 0))(
  ( (array!3648 (arr!1745 (Array (_ BitVec 32) ValueCell!842)) (size!1975 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!592 0))(
  ( (LongMapFixedSize!593 (defaultEntry!2010 Int) (mask!5876 (_ BitVec 32)) (extraKeys!1901 (_ BitVec 32)) (zeroValue!1928 V!2809) (minValue!1928 V!2809) (_size!345 (_ BitVec 32)) (_keys!3629 array!3645) (_values!1993 array!3647) (_vacant!345 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!400 0))(
  ( (Cell!401 (v!2341 LongMapFixedSize!592)) )
))
(declare-datatypes ((LongMap!400 0))(
  ( (LongMap!401 (underlying!211 Cell!400)) )
))
(declare-fun thiss!992 () LongMap!400)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!22195 () Bool)

(declare-fun contains!668 (List!1418 (_ BitVec 64)) Bool)

(assert (=> b!56214 (= lt!22195 (contains!668 lt!22198 (select (arr!1744 (_keys!3629 (v!2341 (underlying!211 thiss!992)))) from!355)))))

(declare-fun b!56215 () Bool)

(declare-fun e!36999 () Bool)

(declare-fun e!37007 () Bool)

(assert (=> b!56215 (= e!36999 e!37007)))

(declare-fun res!31640 () Bool)

(assert (=> b!56215 (=> (not res!31640) (not e!37007))))

(declare-datatypes ((tuple2!2004 0))(
  ( (tuple2!2005 (_1!1013 (_ BitVec 64)) (_2!1013 V!2809)) )
))
(declare-datatypes ((List!1419 0))(
  ( (Nil!1416) (Cons!1415 (h!1995 tuple2!2004) (t!4696 List!1419)) )
))
(declare-datatypes ((ListLongMap!1339 0))(
  ( (ListLongMap!1340 (toList!685 List!1419)) )
))
(declare-fun lt!22194 () ListLongMap!1339)

(declare-fun contains!669 (ListLongMap!1339 (_ BitVec 64)) Bool)

(assert (=> b!56215 (= res!31640 (contains!669 lt!22194 (select (arr!1744 (_keys!3629 (v!2341 (underlying!211 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2006 0))(
  ( (tuple2!2007 (_1!1014 Bool) (_2!1014 LongMapFixedSize!592)) )
))
(declare-fun lt!22193 () tuple2!2006)

(declare-fun newMap!16 () LongMapFixedSize!592)

(declare-fun update!77 (LongMapFixedSize!592 (_ BitVec 64) V!2809) tuple2!2006)

(declare-fun get!1053 (ValueCell!842 V!2809) V!2809)

(declare-fun dynLambda!301 (Int (_ BitVec 64)) V!2809)

(assert (=> b!56215 (= lt!22193 (update!77 newMap!16 (select (arr!1744 (_keys!3629 (v!2341 (underlying!211 thiss!992)))) from!355) (get!1053 (select (arr!1745 (_values!1993 (v!2341 (underlying!211 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2010 (v!2341 (underlying!211 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56216 () Bool)

(assert (=> b!56216 (= e!37007 (not e!37010))))

(declare-fun res!31634 () Bool)

(assert (=> b!56216 (=> res!31634 e!37010)))

(assert (=> b!56216 (= res!31634 (or (bvsge (size!1974 (_keys!3629 (v!2341 (underlying!211 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1974 (_keys!3629 (v!2341 (underlying!211 thiss!992)))))))))

(assert (=> b!56216 (= lt!22198 (Cons!1414 (select (arr!1744 (_keys!3629 (v!2341 (underlying!211 thiss!992)))) from!355) Nil!1415))))

(declare-fun arrayNoDuplicates!0 (array!3645 (_ BitVec 32) List!1418) Bool)

(assert (=> b!56216 (arrayNoDuplicates!0 (_keys!3629 (v!2341 (underlying!211 thiss!992))) from!355 Nil!1415)))

(declare-datatypes ((Unit!1464 0))(
  ( (Unit!1465) )
))
(declare-fun lt!22197 () Unit!1464)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3645 (_ BitVec 32) (_ BitVec 32)) Unit!1464)

(assert (=> b!56216 (= lt!22197 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3629 (v!2341 (underlying!211 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56216 (arrayContainsKey!0 (_keys!3629 (v!2341 (underlying!211 thiss!992))) (select (arr!1744 (_keys!3629 (v!2341 (underlying!211 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22199 () Unit!1464)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!19 (array!3645 array!3647 (_ BitVec 32) (_ BitVec 32) V!2809 V!2809 (_ BitVec 64) (_ BitVec 32) Int) Unit!1464)

(assert (=> b!56216 (= lt!22199 (lemmaListMapContainsThenArrayContainsFrom!19 (_keys!3629 (v!2341 (underlying!211 thiss!992))) (_values!1993 (v!2341 (underlying!211 thiss!992))) (mask!5876 (v!2341 (underlying!211 thiss!992))) (extraKeys!1901 (v!2341 (underlying!211 thiss!992))) (zeroValue!1928 (v!2341 (underlying!211 thiss!992))) (minValue!1928 (v!2341 (underlying!211 thiss!992))) (select (arr!1744 (_keys!3629 (v!2341 (underlying!211 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2010 (v!2341 (underlying!211 thiss!992)))))))

(declare-fun b!56217 () Bool)

(declare-fun e!37011 () Bool)

(declare-fun e!37005 () Bool)

(declare-fun mapRes!2783 () Bool)

(assert (=> b!56217 (= e!37011 (and e!37005 mapRes!2783))))

(declare-fun condMapEmpty!2784 () Bool)

(declare-fun mapDefault!2783 () ValueCell!842)

(assert (=> b!56217 (= condMapEmpty!2784 (= (arr!1745 (_values!1993 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!842)) mapDefault!2783)))))

(declare-fun b!56218 () Bool)

(declare-fun res!31631 () Bool)

(assert (=> b!56218 (=> res!31631 e!37010)))

(declare-fun noDuplicate!47 (List!1418) Bool)

(assert (=> b!56218 (= res!31631 (not (noDuplicate!47 lt!22198)))))

(declare-fun b!56219 () Bool)

(declare-fun e!37000 () Bool)

(declare-fun tp_is_empty!2371 () Bool)

(assert (=> b!56219 (= e!37000 tp_is_empty!2371)))

(declare-fun res!31637 () Bool)

(declare-fun e!37004 () Bool)

(assert (=> start!8376 (=> (not res!31637) (not e!37004))))

(declare-fun valid!240 (LongMap!400) Bool)

(assert (=> start!8376 (= res!31637 (valid!240 thiss!992))))

(assert (=> start!8376 e!37004))

(declare-fun e!37001 () Bool)

(assert (=> start!8376 e!37001))

(assert (=> start!8376 true))

(declare-fun e!37002 () Bool)

(assert (=> start!8376 e!37002))

(declare-fun mapNonEmpty!2783 () Bool)

(declare-fun tp!7827 () Bool)

(declare-fun e!37008 () Bool)

(assert (=> mapNonEmpty!2783 (= mapRes!2783 (and tp!7827 e!37008))))

(declare-fun mapKey!2784 () (_ BitVec 32))

(declare-fun mapValue!2784 () ValueCell!842)

(declare-fun mapRest!2784 () (Array (_ BitVec 32) ValueCell!842))

(assert (=> mapNonEmpty!2783 (= (arr!1745 (_values!1993 newMap!16)) (store mapRest!2784 mapKey!2784 mapValue!2784))))

(declare-fun b!56220 () Bool)

(declare-fun e!37003 () Bool)

(declare-fun e!36998 () Bool)

(assert (=> b!56220 (= e!37003 e!36998)))

(declare-fun mapNonEmpty!2784 () Bool)

(declare-fun mapRes!2784 () Bool)

(declare-fun tp!7828 () Bool)

(declare-fun e!37006 () Bool)

(assert (=> mapNonEmpty!2784 (= mapRes!2784 (and tp!7828 e!37006))))

(declare-fun mapRest!2783 () (Array (_ BitVec 32) ValueCell!842))

(declare-fun mapValue!2783 () ValueCell!842)

(declare-fun mapKey!2783 () (_ BitVec 32))

(assert (=> mapNonEmpty!2784 (= (arr!1745 (_values!1993 (v!2341 (underlying!211 thiss!992)))) (store mapRest!2783 mapKey!2783 mapValue!2783))))

(declare-fun e!37012 () Bool)

(declare-fun array_inv!1077 (array!3645) Bool)

(declare-fun array_inv!1078 (array!3647) Bool)

(assert (=> b!56221 (= e!36998 (and tp!7830 tp_is_empty!2371 (array_inv!1077 (_keys!3629 (v!2341 (underlying!211 thiss!992)))) (array_inv!1078 (_values!1993 (v!2341 (underlying!211 thiss!992)))) e!37012))))

(declare-fun b!56222 () Bool)

(declare-fun res!31633 () Bool)

(assert (=> b!56222 (=> (not res!31633) (not e!37004))))

(declare-fun valid!241 (LongMapFixedSize!592) Bool)

(assert (=> b!56222 (= res!31633 (valid!241 newMap!16))))

(declare-fun b!56223 () Bool)

(declare-fun res!31635 () Bool)

(assert (=> b!56223 (=> res!31635 e!37010)))

(assert (=> b!56223 (= res!31635 (contains!668 lt!22198 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56224 () Bool)

(declare-fun res!31638 () Bool)

(assert (=> b!56224 (=> (not res!31638) (not e!37004))))

(assert (=> b!56224 (= res!31638 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1974 (_keys!3629 (v!2341 (underlying!211 thiss!992)))))))))

(declare-fun b!56225 () Bool)

(assert (=> b!56225 (= e!37008 tp_is_empty!2371)))

(declare-fun b!56226 () Bool)

(assert (=> b!56226 (= e!37006 tp_is_empty!2371)))

(declare-fun b!56227 () Bool)

(assert (=> b!56227 (= e!37005 tp_is_empty!2371)))

(assert (=> b!56228 (= e!37002 (and tp!7829 tp_is_empty!2371 (array_inv!1077 (_keys!3629 newMap!16)) (array_inv!1078 (_values!1993 newMap!16)) e!37011))))

(declare-fun mapIsEmpty!2783 () Bool)

(assert (=> mapIsEmpty!2783 mapRes!2783))

(declare-fun b!56229 () Bool)

(declare-fun res!31636 () Bool)

(assert (=> b!56229 (=> (not res!31636) (not e!37004))))

(assert (=> b!56229 (= res!31636 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5876 newMap!16)) (_size!345 (v!2341 (underlying!211 thiss!992)))))))

(declare-fun b!56230 () Bool)

(assert (=> b!56230 (= e!37012 (and e!37000 mapRes!2784))))

(declare-fun condMapEmpty!2783 () Bool)

(declare-fun mapDefault!2784 () ValueCell!842)

(assert (=> b!56230 (= condMapEmpty!2783 (= (arr!1745 (_values!1993 (v!2341 (underlying!211 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!842)) mapDefault!2784)))))

(declare-fun b!56231 () Bool)

(assert (=> b!56231 (= e!37001 e!37003)))

(declare-fun b!56232 () Bool)

(declare-fun res!31632 () Bool)

(assert (=> b!56232 (=> res!31632 e!37010)))

(assert (=> b!56232 (= res!31632 (not (arrayNoDuplicates!0 (_keys!3629 (v!2341 (underlying!211 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22198)))))

(declare-fun mapIsEmpty!2784 () Bool)

(assert (=> mapIsEmpty!2784 mapRes!2784))

(declare-fun b!56233 () Bool)

(assert (=> b!56233 (= e!37004 e!36999)))

(declare-fun res!31639 () Bool)

(assert (=> b!56233 (=> (not res!31639) (not e!36999))))

(declare-fun lt!22196 () ListLongMap!1339)

(assert (=> b!56233 (= res!31639 (and (= lt!22196 lt!22194) (not (= (select (arr!1744 (_keys!3629 (v!2341 (underlying!211 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1744 (_keys!3629 (v!2341 (underlying!211 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1089 (LongMapFixedSize!592) ListLongMap!1339)

(assert (=> b!56233 (= lt!22194 (map!1089 newMap!16))))

(declare-fun getCurrentListMap!383 (array!3645 array!3647 (_ BitVec 32) (_ BitVec 32) V!2809 V!2809 (_ BitVec 32) Int) ListLongMap!1339)

(assert (=> b!56233 (= lt!22196 (getCurrentListMap!383 (_keys!3629 (v!2341 (underlying!211 thiss!992))) (_values!1993 (v!2341 (underlying!211 thiss!992))) (mask!5876 (v!2341 (underlying!211 thiss!992))) (extraKeys!1901 (v!2341 (underlying!211 thiss!992))) (zeroValue!1928 (v!2341 (underlying!211 thiss!992))) (minValue!1928 (v!2341 (underlying!211 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2010 (v!2341 (underlying!211 thiss!992)))))))

(declare-fun b!56234 () Bool)

(declare-fun res!31641 () Bool)

(assert (=> b!56234 (=> res!31641 e!37010)))

(assert (=> b!56234 (= res!31641 (contains!668 lt!22198 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!8376 res!31637) b!56224))

(assert (= (and b!56224 res!31638) b!56222))

(assert (= (and b!56222 res!31633) b!56229))

(assert (= (and b!56229 res!31636) b!56233))

(assert (= (and b!56233 res!31639) b!56215))

(assert (= (and b!56215 res!31640) b!56216))

(assert (= (and b!56216 (not res!31634)) b!56218))

(assert (= (and b!56218 (not res!31631)) b!56234))

(assert (= (and b!56234 (not res!31641)) b!56223))

(assert (= (and b!56223 (not res!31635)) b!56232))

(assert (= (and b!56232 (not res!31632)) b!56214))

(assert (= (and b!56230 condMapEmpty!2783) mapIsEmpty!2784))

(assert (= (and b!56230 (not condMapEmpty!2783)) mapNonEmpty!2784))

(get-info :version)

(assert (= (and mapNonEmpty!2784 ((_ is ValueCellFull!842) mapValue!2783)) b!56226))

(assert (= (and b!56230 ((_ is ValueCellFull!842) mapDefault!2784)) b!56219))

(assert (= b!56221 b!56230))

(assert (= b!56220 b!56221))

(assert (= b!56231 b!56220))

(assert (= start!8376 b!56231))

(assert (= (and b!56217 condMapEmpty!2784) mapIsEmpty!2783))

(assert (= (and b!56217 (not condMapEmpty!2784)) mapNonEmpty!2783))

(assert (= (and mapNonEmpty!2783 ((_ is ValueCellFull!842) mapValue!2784)) b!56225))

(assert (= (and b!56217 ((_ is ValueCellFull!842) mapDefault!2783)) b!56227))

(assert (= b!56228 b!56217))

(assert (= start!8376 b!56228))

(declare-fun b_lambda!2469 () Bool)

(assert (=> (not b_lambda!2469) (not b!56215)))

(declare-fun t!4692 () Bool)

(declare-fun tb!1253 () Bool)

(assert (=> (and b!56221 (= (defaultEntry!2010 (v!2341 (underlying!211 thiss!992))) (defaultEntry!2010 (v!2341 (underlying!211 thiss!992)))) t!4692) tb!1253))

(declare-fun result!2277 () Bool)

(assert (=> tb!1253 (= result!2277 tp_is_empty!2371)))

(assert (=> b!56215 t!4692))

(declare-fun b_and!3365 () Bool)

(assert (= b_and!3361 (and (=> t!4692 result!2277) b_and!3365)))

(declare-fun tb!1255 () Bool)

(declare-fun t!4694 () Bool)

(assert (=> (and b!56228 (= (defaultEntry!2010 newMap!16) (defaultEntry!2010 (v!2341 (underlying!211 thiss!992)))) t!4694) tb!1255))

(declare-fun result!2281 () Bool)

(assert (= result!2281 result!2277))

(assert (=> b!56215 t!4694))

(declare-fun b_and!3367 () Bool)

(assert (= b_and!3363 (and (=> t!4694 result!2281) b_and!3367)))

(declare-fun m!47323 () Bool)

(assert (=> b!56223 m!47323))

(declare-fun m!47325 () Bool)

(assert (=> b!56222 m!47325))

(declare-fun m!47327 () Bool)

(assert (=> mapNonEmpty!2784 m!47327))

(declare-fun m!47329 () Bool)

(assert (=> b!56228 m!47329))

(declare-fun m!47331 () Bool)

(assert (=> b!56228 m!47331))

(declare-fun m!47333 () Bool)

(assert (=> b!56232 m!47333))

(declare-fun m!47335 () Bool)

(assert (=> b!56234 m!47335))

(declare-fun m!47337 () Bool)

(assert (=> b!56216 m!47337))

(declare-fun m!47339 () Bool)

(assert (=> b!56216 m!47339))

(declare-fun m!47341 () Bool)

(assert (=> b!56216 m!47341))

(declare-fun m!47343 () Bool)

(assert (=> b!56216 m!47343))

(assert (=> b!56216 m!47341))

(assert (=> b!56216 m!47341))

(declare-fun m!47345 () Bool)

(assert (=> b!56216 m!47345))

(declare-fun m!47347 () Bool)

(assert (=> mapNonEmpty!2783 m!47347))

(assert (=> b!56214 m!47341))

(assert (=> b!56214 m!47341))

(declare-fun m!47349 () Bool)

(assert (=> b!56214 m!47349))

(assert (=> b!56233 m!47341))

(declare-fun m!47351 () Bool)

(assert (=> b!56233 m!47351))

(declare-fun m!47353 () Bool)

(assert (=> b!56233 m!47353))

(declare-fun m!47355 () Bool)

(assert (=> b!56215 m!47355))

(declare-fun m!47357 () Bool)

(assert (=> b!56215 m!47357))

(declare-fun m!47359 () Bool)

(assert (=> b!56215 m!47359))

(assert (=> b!56215 m!47341))

(assert (=> b!56215 m!47341))

(declare-fun m!47361 () Bool)

(assert (=> b!56215 m!47361))

(assert (=> b!56215 m!47357))

(assert (=> b!56215 m!47341))

(assert (=> b!56215 m!47359))

(declare-fun m!47363 () Bool)

(assert (=> b!56215 m!47363))

(assert (=> b!56215 m!47355))

(declare-fun m!47365 () Bool)

(assert (=> b!56218 m!47365))

(declare-fun m!47367 () Bool)

(assert (=> start!8376 m!47367))

(declare-fun m!47369 () Bool)

(assert (=> b!56221 m!47369))

(declare-fun m!47371 () Bool)

(assert (=> b!56221 m!47371))

(check-sat (not b!56233) (not b!56218) (not mapNonEmpty!2784) (not b!56234) (not b!56222) tp_is_empty!2371 (not b_next!1911) b_and!3367 (not b!56228) (not b_next!1909) (not b!56214) b_and!3365 (not b!56232) (not b!56215) (not b_lambda!2469) (not start!8376) (not mapNonEmpty!2783) (not b!56223) (not b!56221) (not b!56216))
(check-sat b_and!3365 b_and!3367 (not b_next!1909) (not b_next!1911))
