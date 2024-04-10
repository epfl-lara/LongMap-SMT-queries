; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8248 () Bool)

(assert start!8248)

(declare-fun b!52468 () Bool)

(declare-fun b_free!1661 () Bool)

(declare-fun b_next!1661 () Bool)

(assert (=> b!52468 (= b_free!1661 (not b_next!1661))))

(declare-fun tp!7085 () Bool)

(declare-fun b_and!2871 () Bool)

(assert (=> b!52468 (= tp!7085 b_and!2871)))

(declare-fun b!52463 () Bool)

(declare-fun b_free!1663 () Bool)

(declare-fun b_next!1663 () Bool)

(assert (=> b!52463 (= b_free!1663 (not b_next!1663))))

(declare-fun tp!7086 () Bool)

(declare-fun b_and!2873 () Bool)

(assert (=> b!52463 (= tp!7086 b_and!2873)))

(declare-fun mapIsEmpty!2411 () Bool)

(declare-fun mapRes!2412 () Bool)

(assert (=> mapIsEmpty!2411 mapRes!2412))

(declare-fun b!52462 () Bool)

(declare-fun e!34174 () Bool)

(assert (=> b!52462 (= e!34174 false)))

(declare-datatypes ((V!2643 0))(
  ( (V!2644 (val!1168 Int)) )
))
(declare-datatypes ((tuple2!1850 0))(
  ( (tuple2!1851 (_1!936 (_ BitVec 64)) (_2!936 V!2643)) )
))
(declare-datatypes ((List!1341 0))(
  ( (Nil!1338) (Cons!1337 (h!1917 tuple2!1850) (t!4375 List!1341)) )
))
(declare-datatypes ((ListLongMap!1265 0))(
  ( (ListLongMap!1266 (toList!648 List!1341)) )
))
(declare-fun lt!21287 () ListLongMap!1265)

(declare-datatypes ((array!3417 0))(
  ( (array!3418 (arr!1631 (Array (_ BitVec 32) (_ BitVec 64))) (size!1860 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!780 0))(
  ( (ValueCellFull!780 (v!2225 V!2643)) (EmptyCell!780) )
))
(declare-datatypes ((array!3419 0))(
  ( (array!3420 (arr!1632 (Array (_ BitVec 32) ValueCell!780)) (size!1861 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!468 0))(
  ( (LongMapFixedSize!469 (defaultEntry!1948 Int) (mask!5773 (_ BitVec 32)) (extraKeys!1839 (_ BitVec 32)) (zeroValue!1866 V!2643) (minValue!1866 V!2643) (_size!283 (_ BitVec 32)) (_keys!3568 array!3417) (_values!1931 array!3419) (_vacant!283 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!468)

(declare-fun map!1014 (LongMapFixedSize!468) ListLongMap!1265)

(assert (=> b!52462 (= lt!21287 (map!1014 newMap!16))))

(declare-fun lt!21288 () ListLongMap!1265)

(declare-datatypes ((Cell!290 0))(
  ( (Cell!291 (v!2226 LongMapFixedSize!468)) )
))
(declare-datatypes ((LongMap!290 0))(
  ( (LongMap!291 (underlying!156 Cell!290)) )
))
(declare-fun thiss!992 () LongMap!290)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!361 (array!3417 array!3419 (_ BitVec 32) (_ BitVec 32) V!2643 V!2643 (_ BitVec 32) Int) ListLongMap!1265)

(assert (=> b!52462 (= lt!21288 (getCurrentListMap!361 (_keys!3568 (v!2226 (underlying!156 thiss!992))) (_values!1931 (v!2226 (underlying!156 thiss!992))) (mask!5773 (v!2226 (underlying!156 thiss!992))) (extraKeys!1839 (v!2226 (underlying!156 thiss!992))) (zeroValue!1866 (v!2226 (underlying!156 thiss!992))) (minValue!1866 (v!2226 (underlying!156 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1948 (v!2226 (underlying!156 thiss!992)))))))

(declare-fun e!34177 () Bool)

(declare-fun e!34171 () Bool)

(declare-fun tp_is_empty!2247 () Bool)

(declare-fun array_inv!1007 (array!3417) Bool)

(declare-fun array_inv!1008 (array!3419) Bool)

(assert (=> b!52463 (= e!34171 (and tp!7086 tp_is_empty!2247 (array_inv!1007 (_keys!3568 newMap!16)) (array_inv!1008 (_values!1931 newMap!16)) e!34177))))

(declare-fun b!52464 () Bool)

(declare-fun e!34175 () Bool)

(assert (=> b!52464 (= e!34175 tp_is_empty!2247)))

(declare-fun res!29814 () Bool)

(assert (=> start!8248 (=> (not res!29814) (not e!34174))))

(declare-fun valid!170 (LongMap!290) Bool)

(assert (=> start!8248 (= res!29814 (valid!170 thiss!992))))

(assert (=> start!8248 e!34174))

(declare-fun e!34172 () Bool)

(assert (=> start!8248 e!34172))

(assert (=> start!8248 true))

(assert (=> start!8248 e!34171))

(declare-fun b!52465 () Bool)

(declare-fun e!34166 () Bool)

(declare-fun e!34167 () Bool)

(assert (=> b!52465 (= e!34166 e!34167)))

(declare-fun b!52466 () Bool)

(declare-fun e!34168 () Bool)

(assert (=> b!52466 (= e!34168 tp_is_empty!2247)))

(declare-fun b!52467 () Bool)

(declare-fun res!29816 () Bool)

(assert (=> b!52467 (=> (not res!29816) (not e!34174))))

(declare-fun valid!171 (LongMapFixedSize!468) Bool)

(assert (=> b!52467 (= res!29816 (valid!171 newMap!16))))

(declare-fun e!34169 () Bool)

(assert (=> b!52468 (= e!34167 (and tp!7085 tp_is_empty!2247 (array_inv!1007 (_keys!3568 (v!2226 (underlying!156 thiss!992)))) (array_inv!1008 (_values!1931 (v!2226 (underlying!156 thiss!992)))) e!34169))))

(declare-fun b!52469 () Bool)

(declare-fun res!29815 () Bool)

(assert (=> b!52469 (=> (not res!29815) (not e!34174))))

(assert (=> b!52469 (= res!29815 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1860 (_keys!3568 (v!2226 (underlying!156 thiss!992)))))))))

(declare-fun mapNonEmpty!2411 () Bool)

(declare-fun mapRes!2411 () Bool)

(declare-fun tp!7083 () Bool)

(declare-fun e!34176 () Bool)

(assert (=> mapNonEmpty!2411 (= mapRes!2411 (and tp!7083 e!34176))))

(declare-fun mapRest!2411 () (Array (_ BitVec 32) ValueCell!780))

(declare-fun mapKey!2411 () (_ BitVec 32))

(declare-fun mapValue!2411 () ValueCell!780)

(assert (=> mapNonEmpty!2411 (= (arr!1632 (_values!1931 newMap!16)) (store mapRest!2411 mapKey!2411 mapValue!2411))))

(declare-fun b!52470 () Bool)

(declare-fun e!34173 () Bool)

(assert (=> b!52470 (= e!34177 (and e!34173 mapRes!2411))))

(declare-fun condMapEmpty!2412 () Bool)

(declare-fun mapDefault!2412 () ValueCell!780)

(assert (=> b!52470 (= condMapEmpty!2412 (= (arr!1632 (_values!1931 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!780)) mapDefault!2412)))))

(declare-fun b!52471 () Bool)

(declare-fun res!29813 () Bool)

(assert (=> b!52471 (=> (not res!29813) (not e!34174))))

(assert (=> b!52471 (= res!29813 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5773 newMap!16)) (_size!283 (v!2226 (underlying!156 thiss!992)))))))

(declare-fun b!52472 () Bool)

(assert (=> b!52472 (= e!34176 tp_is_empty!2247)))

(declare-fun b!52473 () Bool)

(assert (=> b!52473 (= e!34169 (and e!34168 mapRes!2412))))

(declare-fun condMapEmpty!2411 () Bool)

(declare-fun mapDefault!2411 () ValueCell!780)

(assert (=> b!52473 (= condMapEmpty!2411 (= (arr!1632 (_values!1931 (v!2226 (underlying!156 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!780)) mapDefault!2411)))))

(declare-fun b!52474 () Bool)

(assert (=> b!52474 (= e!34173 tp_is_empty!2247)))

(declare-fun b!52475 () Bool)

(assert (=> b!52475 (= e!34172 e!34166)))

(declare-fun mapNonEmpty!2412 () Bool)

(declare-fun tp!7084 () Bool)

(assert (=> mapNonEmpty!2412 (= mapRes!2412 (and tp!7084 e!34175))))

(declare-fun mapValue!2412 () ValueCell!780)

(declare-fun mapKey!2412 () (_ BitVec 32))

(declare-fun mapRest!2412 () (Array (_ BitVec 32) ValueCell!780))

(assert (=> mapNonEmpty!2412 (= (arr!1632 (_values!1931 (v!2226 (underlying!156 thiss!992)))) (store mapRest!2412 mapKey!2412 mapValue!2412))))

(declare-fun mapIsEmpty!2412 () Bool)

(assert (=> mapIsEmpty!2412 mapRes!2411))

(assert (= (and start!8248 res!29814) b!52469))

(assert (= (and b!52469 res!29815) b!52467))

(assert (= (and b!52467 res!29816) b!52471))

(assert (= (and b!52471 res!29813) b!52462))

(assert (= (and b!52473 condMapEmpty!2411) mapIsEmpty!2411))

(assert (= (and b!52473 (not condMapEmpty!2411)) mapNonEmpty!2412))

(get-info :version)

(assert (= (and mapNonEmpty!2412 ((_ is ValueCellFull!780) mapValue!2412)) b!52464))

(assert (= (and b!52473 ((_ is ValueCellFull!780) mapDefault!2411)) b!52466))

(assert (= b!52468 b!52473))

(assert (= b!52465 b!52468))

(assert (= b!52475 b!52465))

(assert (= start!8248 b!52475))

(assert (= (and b!52470 condMapEmpty!2412) mapIsEmpty!2412))

(assert (= (and b!52470 (not condMapEmpty!2412)) mapNonEmpty!2411))

(assert (= (and mapNonEmpty!2411 ((_ is ValueCellFull!780) mapValue!2411)) b!52472))

(assert (= (and b!52470 ((_ is ValueCellFull!780) mapDefault!2412)) b!52474))

(assert (= b!52463 b!52470))

(assert (= start!8248 b!52463))

(declare-fun m!44845 () Bool)

(assert (=> b!52467 m!44845))

(declare-fun m!44847 () Bool)

(assert (=> b!52468 m!44847))

(declare-fun m!44849 () Bool)

(assert (=> b!52468 m!44849))

(declare-fun m!44851 () Bool)

(assert (=> mapNonEmpty!2411 m!44851))

(declare-fun m!44853 () Bool)

(assert (=> b!52462 m!44853))

(declare-fun m!44855 () Bool)

(assert (=> b!52462 m!44855))

(declare-fun m!44857 () Bool)

(assert (=> b!52463 m!44857))

(declare-fun m!44859 () Bool)

(assert (=> b!52463 m!44859))

(declare-fun m!44861 () Bool)

(assert (=> start!8248 m!44861))

(declare-fun m!44863 () Bool)

(assert (=> mapNonEmpty!2412 m!44863))

(check-sat (not start!8248) (not b!52467) (not b_next!1663) (not b!52468) (not mapNonEmpty!2411) b_and!2871 (not mapNonEmpty!2412) tp_is_empty!2247 (not b_next!1661) (not b!52463) b_and!2873 (not b!52462))
(check-sat b_and!2871 b_and!2873 (not b_next!1661) (not b_next!1663))
