; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10184 () Bool)

(assert start!10184)

(declare-fun b!77799 () Bool)

(declare-fun b_free!2185 () Bool)

(declare-fun b_next!2185 () Bool)

(assert (=> b!77799 (= b_free!2185 (not b_next!2185))))

(declare-fun tp!8758 () Bool)

(declare-fun b_and!4783 () Bool)

(assert (=> b!77799 (= tp!8758 b_and!4783)))

(declare-fun b!77785 () Bool)

(declare-fun b_free!2187 () Bool)

(declare-fun b_next!2187 () Bool)

(assert (=> b!77785 (= b_free!2187 (not b_next!2187))))

(declare-fun tp!8756 () Bool)

(declare-fun b_and!4785 () Bool)

(assert (=> b!77785 (= tp!8756 b_and!4785)))

(declare-fun b!77782 () Bool)

(declare-fun res!40800 () Bool)

(declare-fun e!50865 () Bool)

(assert (=> b!77782 (=> (not res!40800) (not e!50865))))

(declare-datatypes ((V!2993 0))(
  ( (V!2994 (val!1299 Int)) )
))
(declare-datatypes ((array!3971 0))(
  ( (array!3972 (arr!1893 (Array (_ BitVec 32) (_ BitVec 64))) (size!2134 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!911 0))(
  ( (ValueCellFull!911 (v!2589 V!2993)) (EmptyCell!911) )
))
(declare-datatypes ((array!3973 0))(
  ( (array!3974 (arr!1894 (Array (_ BitVec 32) ValueCell!911)) (size!2135 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!730 0))(
  ( (LongMapFixedSize!731 (defaultEntry!2271 Int) (mask!6267 (_ BitVec 32)) (extraKeys!2122 (_ BitVec 32)) (zeroValue!2169 V!2993) (minValue!2169 V!2993) (_size!414 (_ BitVec 32)) (_keys!3931 array!3971) (_values!2254 array!3973) (_vacant!414 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!730)

(declare-datatypes ((Cell!532 0))(
  ( (Cell!533 (v!2590 LongMapFixedSize!730)) )
))
(declare-datatypes ((LongMap!532 0))(
  ( (LongMap!533 (underlying!277 Cell!532)) )
))
(declare-fun thiss!992 () LongMap!532)

(assert (=> b!77782 (= res!40800 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6267 newMap!16)) (_size!414 (v!2590 (underlying!277 thiss!992)))))))

(declare-fun b!77783 () Bool)

(declare-fun e!50867 () Bool)

(declare-fun tp_is_empty!2509 () Bool)

(assert (=> b!77783 (= e!50867 tp_is_empty!2509)))

(declare-fun b!77784 () Bool)

(declare-fun e!50857 () Bool)

(assert (=> b!77784 (= e!50865 e!50857)))

(declare-fun res!40798 () Bool)

(assert (=> b!77784 (=> (not res!40798) (not e!50857))))

(declare-datatypes ((tuple2!2168 0))(
  ( (tuple2!2169 (_1!1095 (_ BitVec 64)) (_2!1095 V!2993)) )
))
(declare-datatypes ((List!1505 0))(
  ( (Nil!1502) (Cons!1501 (h!2089 tuple2!2168) (t!5147 List!1505)) )
))
(declare-datatypes ((ListLongMap!1445 0))(
  ( (ListLongMap!1446 (toList!738 List!1505)) )
))
(declare-fun lt!35811 () ListLongMap!1445)

(declare-fun lt!35807 () ListLongMap!1445)

(assert (=> b!77784 (= res!40798 (= lt!35811 lt!35807))))

(declare-fun map!1173 (LongMapFixedSize!730) ListLongMap!1445)

(assert (=> b!77784 (= lt!35807 (map!1173 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!432 (array!3971 array!3973 (_ BitVec 32) (_ BitVec 32) V!2993 V!2993 (_ BitVec 32) Int) ListLongMap!1445)

(assert (=> b!77784 (= lt!35811 (getCurrentListMap!432 (_keys!3931 (v!2590 (underlying!277 thiss!992))) (_values!2254 (v!2590 (underlying!277 thiss!992))) (mask!6267 (v!2590 (underlying!277 thiss!992))) (extraKeys!2122 (v!2590 (underlying!277 thiss!992))) (zeroValue!2169 (v!2590 (underlying!277 thiss!992))) (minValue!2169 (v!2590 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2271 (v!2590 (underlying!277 thiss!992)))))))

(declare-fun e!50856 () Bool)

(declare-fun e!50862 () Bool)

(declare-fun array_inv!1169 (array!3971) Bool)

(declare-fun array_inv!1170 (array!3973) Bool)

(assert (=> b!77785 (= e!50862 (and tp!8756 tp_is_empty!2509 (array_inv!1169 (_keys!3931 newMap!16)) (array_inv!1170 (_values!2254 newMap!16)) e!50856))))

(declare-fun b!77786 () Bool)

(declare-fun e!50870 () Bool)

(declare-fun e!50868 () Bool)

(assert (=> b!77786 (= e!50870 e!50868)))

(declare-fun res!40803 () Bool)

(assert (=> b!77786 (=> (not res!40803) (not e!50868))))

(declare-datatypes ((tuple2!2170 0))(
  ( (tuple2!2171 (_1!1096 Bool) (_2!1096 LongMapFixedSize!730)) )
))
(declare-fun lt!35799 () tuple2!2170)

(assert (=> b!77786 (= res!40803 (and (_1!1096 lt!35799) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2253 0))(
  ( (Unit!2254) )
))
(declare-fun lt!35804 () Unit!2253)

(declare-fun e!50873 () Unit!2253)

(assert (=> b!77786 (= lt!35804 e!50873)))

(declare-fun c!11889 () Bool)

(declare-fun contains!741 (ListLongMap!1445 (_ BitVec 64)) Bool)

(assert (=> b!77786 (= c!11889 (contains!741 lt!35807 (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355)))))

(declare-fun lt!35809 () V!2993)

(declare-fun update!106 (LongMapFixedSize!730 (_ BitVec 64) V!2993) tuple2!2170)

(assert (=> b!77786 (= lt!35799 (update!106 newMap!16 (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355) lt!35809))))

(declare-fun b!77787 () Bool)

(declare-fun e!50872 () Bool)

(assert (=> b!77787 (= e!50868 (not e!50872))))

(declare-fun res!40801 () Bool)

(assert (=> b!77787 (=> res!40801 e!50872)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!77787 (= res!40801 (not (validMask!0 (mask!6267 (v!2590 (underlying!277 thiss!992))))))))

(declare-fun lt!35816 () ListLongMap!1445)

(declare-fun lt!35806 () ListLongMap!1445)

(declare-fun lt!35808 () tuple2!2168)

(declare-fun lt!35815 () tuple2!2168)

(declare-fun +!104 (ListLongMap!1445 tuple2!2168) ListLongMap!1445)

(assert (=> b!77787 (= (+!104 lt!35816 lt!35808) (+!104 (+!104 lt!35806 lt!35808) lt!35815))))

(assert (=> b!77787 (= lt!35808 (tuple2!2169 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2169 (v!2590 (underlying!277 thiss!992)))))))

(declare-fun lt!35802 () Unit!2253)

(declare-fun addCommutativeForDiffKeys!23 (ListLongMap!1445 (_ BitVec 64) V!2993 (_ BitVec 64) V!2993) Unit!2253)

(assert (=> b!77787 (= lt!35802 (addCommutativeForDiffKeys!23 lt!35806 (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355) lt!35809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2169 (v!2590 (underlying!277 thiss!992)))))))

(declare-fun lt!35814 () ListLongMap!1445)

(assert (=> b!77787 (= lt!35814 lt!35816)))

(assert (=> b!77787 (= lt!35816 (+!104 lt!35806 lt!35815))))

(declare-fun lt!35812 () ListLongMap!1445)

(declare-fun lt!35803 () tuple2!2168)

(assert (=> b!77787 (= lt!35814 (+!104 lt!35812 lt!35803))))

(declare-fun lt!35813 () ListLongMap!1445)

(assert (=> b!77787 (= lt!35806 (+!104 lt!35813 lt!35803))))

(assert (=> b!77787 (= lt!35803 (tuple2!2169 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2169 (v!2590 (underlying!277 thiss!992)))))))

(assert (=> b!77787 (= lt!35812 (+!104 lt!35813 lt!35815))))

(assert (=> b!77787 (= lt!35815 (tuple2!2169 (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355) lt!35809))))

(declare-fun lt!35805 () Unit!2253)

(assert (=> b!77787 (= lt!35805 (addCommutativeForDiffKeys!23 lt!35813 (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355) lt!35809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2169 (v!2590 (underlying!277 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!69 (array!3971 array!3973 (_ BitVec 32) (_ BitVec 32) V!2993 V!2993 (_ BitVec 32) Int) ListLongMap!1445)

(assert (=> b!77787 (= lt!35813 (getCurrentListMapNoExtraKeys!69 (_keys!3931 (v!2590 (underlying!277 thiss!992))) (_values!2254 (v!2590 (underlying!277 thiss!992))) (mask!6267 (v!2590 (underlying!277 thiss!992))) (extraKeys!2122 (v!2590 (underlying!277 thiss!992))) (zeroValue!2169 (v!2590 (underlying!277 thiss!992))) (minValue!2169 (v!2590 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2271 (v!2590 (underlying!277 thiss!992)))))))

(declare-fun b!77788 () Bool)

(assert (=> b!77788 (= e!50872 (= (size!2135 (_values!2254 (v!2590 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6267 (v!2590 (underlying!277 thiss!992))))))))

(declare-fun b!77789 () Bool)

(declare-fun Unit!2255 () Unit!2253)

(assert (=> b!77789 (= e!50873 Unit!2255)))

(declare-fun lt!35810 () Unit!2253)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!61 (array!3971 array!3973 (_ BitVec 32) (_ BitVec 32) V!2993 V!2993 (_ BitVec 64) (_ BitVec 32) Int) Unit!2253)

(assert (=> b!77789 (= lt!35810 (lemmaListMapContainsThenArrayContainsFrom!61 (_keys!3931 (v!2590 (underlying!277 thiss!992))) (_values!2254 (v!2590 (underlying!277 thiss!992))) (mask!6267 (v!2590 (underlying!277 thiss!992))) (extraKeys!2122 (v!2590 (underlying!277 thiss!992))) (zeroValue!2169 (v!2590 (underlying!277 thiss!992))) (minValue!2169 (v!2590 (underlying!277 thiss!992))) (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2271 (v!2590 (underlying!277 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!77789 (arrayContainsKey!0 (_keys!3931 (v!2590 (underlying!277 thiss!992))) (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35801 () Unit!2253)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3971 (_ BitVec 32) (_ BitVec 32)) Unit!2253)

(assert (=> b!77789 (= lt!35801 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3931 (v!2590 (underlying!277 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1506 0))(
  ( (Nil!1503) (Cons!1502 (h!2090 (_ BitVec 64)) (t!5148 List!1506)) )
))
(declare-fun arrayNoDuplicates!0 (array!3971 (_ BitVec 32) List!1506) Bool)

(assert (=> b!77789 (arrayNoDuplicates!0 (_keys!3931 (v!2590 (underlying!277 thiss!992))) from!355 Nil!1503)))

(declare-fun lt!35800 () Unit!2253)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3971 (_ BitVec 32) (_ BitVec 64) List!1506) Unit!2253)

(assert (=> b!77789 (= lt!35800 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3931 (v!2590 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355) (Cons!1502 (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355) Nil!1503)))))

(assert (=> b!77789 false))

(declare-fun b!77790 () Bool)

(assert (=> b!77790 (= e!50857 e!50870)))

(declare-fun res!40804 () Bool)

(assert (=> b!77790 (=> (not res!40804) (not e!50870))))

(assert (=> b!77790 (= res!40804 (and (not (= (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1893 (_keys!3931 (v!2590 (underlying!277 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1172 (ValueCell!911 V!2993) V!2993)

(declare-fun dynLambda!335 (Int (_ BitVec 64)) V!2993)

(assert (=> b!77790 (= lt!35809 (get!1172 (select (arr!1894 (_values!2254 (v!2590 (underlying!277 thiss!992)))) from!355) (dynLambda!335 (defaultEntry!2271 (v!2590 (underlying!277 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!3297 () Bool)

(declare-fun mapRes!3298 () Bool)

(declare-fun tp!8755 () Bool)

(declare-fun e!50871 () Bool)

(assert (=> mapNonEmpty!3297 (= mapRes!3298 (and tp!8755 e!50871))))

(declare-fun mapValue!3298 () ValueCell!911)

(declare-fun mapKey!3297 () (_ BitVec 32))

(declare-fun mapRest!3297 () (Array (_ BitVec 32) ValueCell!911))

(assert (=> mapNonEmpty!3297 (= (arr!1894 (_values!2254 newMap!16)) (store mapRest!3297 mapKey!3297 mapValue!3298))))

(declare-fun b!77791 () Bool)

(declare-fun Unit!2256 () Unit!2253)

(assert (=> b!77791 (= e!50873 Unit!2256)))

(declare-fun res!40802 () Bool)

(assert (=> start!10184 (=> (not res!40802) (not e!50865))))

(declare-fun valid!310 (LongMap!532) Bool)

(assert (=> start!10184 (= res!40802 (valid!310 thiss!992))))

(assert (=> start!10184 e!50865))

(declare-fun e!50869 () Bool)

(assert (=> start!10184 e!50869))

(assert (=> start!10184 true))

(assert (=> start!10184 e!50862))

(declare-fun b!77792 () Bool)

(declare-fun e!50866 () Bool)

(assert (=> b!77792 (= e!50866 tp_is_empty!2509)))

(declare-fun mapNonEmpty!3298 () Bool)

(declare-fun mapRes!3297 () Bool)

(declare-fun tp!8757 () Bool)

(assert (=> mapNonEmpty!3298 (= mapRes!3297 (and tp!8757 e!50867))))

(declare-fun mapValue!3297 () ValueCell!911)

(declare-fun mapRest!3298 () (Array (_ BitVec 32) ValueCell!911))

(declare-fun mapKey!3298 () (_ BitVec 32))

(assert (=> mapNonEmpty!3298 (= (arr!1894 (_values!2254 (v!2590 (underlying!277 thiss!992)))) (store mapRest!3298 mapKey!3298 mapValue!3297))))

(declare-fun mapIsEmpty!3297 () Bool)

(assert (=> mapIsEmpty!3297 mapRes!3297))

(declare-fun b!77793 () Bool)

(declare-fun e!50860 () Bool)

(declare-fun e!50858 () Bool)

(assert (=> b!77793 (= e!50860 e!50858)))

(declare-fun b!77794 () Bool)

(assert (=> b!77794 (= e!50869 e!50860)))

(declare-fun b!77795 () Bool)

(declare-fun res!40799 () Bool)

(assert (=> b!77795 (=> (not res!40799) (not e!50865))))

(declare-fun valid!311 (LongMapFixedSize!730) Bool)

(assert (=> b!77795 (= res!40799 (valid!311 newMap!16))))

(declare-fun b!77796 () Bool)

(declare-fun e!50863 () Bool)

(assert (=> b!77796 (= e!50863 (and e!50866 mapRes!3297))))

(declare-fun condMapEmpty!3297 () Bool)

(declare-fun mapDefault!3297 () ValueCell!911)

