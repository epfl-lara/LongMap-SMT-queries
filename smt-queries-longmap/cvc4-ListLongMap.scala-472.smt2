; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9222 () Bool)

(assert start!9222)

(declare-fun b!65943 () Bool)

(declare-fun b_free!2061 () Bool)

(declare-fun b_next!2061 () Bool)

(assert (=> b!65943 (= b_free!2061 (not b_next!2061))))

(declare-fun tp!8331 () Bool)

(declare-fun b_and!4075 () Bool)

(assert (=> b!65943 (= tp!8331 b_and!4075)))

(declare-fun b!65942 () Bool)

(declare-fun b_free!2063 () Bool)

(declare-fun b_next!2063 () Bool)

(assert (=> b!65942 (= b_free!2063 (not b_next!2063))))

(declare-fun tp!8333 () Bool)

(declare-fun b_and!4077 () Bool)

(assert (=> b!65942 (= tp!8333 b_and!4077)))

(declare-fun b!65928 () Bool)

(declare-fun e!43267 () Bool)

(declare-fun tp_is_empty!2447 () Bool)

(assert (=> b!65928 (= e!43267 tp_is_empty!2447)))

(declare-fun b!65929 () Bool)

(declare-datatypes ((Unit!1829 0))(
  ( (Unit!1830) )
))
(declare-fun e!43262 () Unit!1829)

(declare-fun Unit!1831 () Unit!1829)

(assert (=> b!65929 (= e!43262 Unit!1831)))

(declare-fun b!65930 () Bool)

(declare-fun e!43268 () Bool)

(declare-datatypes ((V!2909 0))(
  ( (V!2910 (val!1268 Int)) )
))
(declare-datatypes ((array!3831 0))(
  ( (array!3832 (arr!1831 (Array (_ BitVec 32) (_ BitVec 64))) (size!2066 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!880 0))(
  ( (ValueCellFull!880 (v!2471 V!2909)) (EmptyCell!880) )
))
(declare-datatypes ((array!3833 0))(
  ( (array!3834 (arr!1832 (Array (_ BitVec 32) ValueCell!880)) (size!2067 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!668 0))(
  ( (LongMapFixedSize!669 (defaultEntry!2142 Int) (mask!6074 (_ BitVec 32)) (extraKeys!2013 (_ BitVec 32)) (zeroValue!2050 V!2909) (minValue!2050 V!2909) (_size!383 (_ BitVec 32)) (_keys!3782 array!3831) (_values!2125 array!3833) (_vacant!383 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!474 0))(
  ( (Cell!475 (v!2472 LongMapFixedSize!668)) )
))
(declare-datatypes ((LongMap!474 0))(
  ( (LongMap!475 (underlying!248 Cell!474)) )
))
(declare-fun thiss!992 () LongMap!474)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!65930 (= e!43268 (not (validMask!0 (mask!6074 (v!2472 (underlying!248 thiss!992))))))))

(declare-datatypes ((tuple2!2086 0))(
  ( (tuple2!2087 (_1!1054 (_ BitVec 64)) (_2!1054 V!2909)) )
))
(declare-datatypes ((List!1463 0))(
  ( (Nil!1460) (Cons!1459 (h!2043 tuple2!2086) (t!4937 List!1463)) )
))
(declare-datatypes ((ListLongMap!1399 0))(
  ( (ListLongMap!1400 (toList!715 List!1463)) )
))
(declare-fun lt!28330 () ListLongMap!1399)

(declare-fun lt!28334 () tuple2!2086)

(declare-fun lt!28336 () tuple2!2086)

(declare-fun +!87 (ListLongMap!1399 tuple2!2086) ListLongMap!1399)

(assert (=> b!65930 (= (+!87 (+!87 lt!28330 lt!28334) lt!28336) (+!87 (+!87 lt!28330 lt!28336) lt!28334))))

(assert (=> b!65930 (= lt!28336 (tuple2!2087 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2050 (v!2472 (underlying!248 thiss!992)))))))

(declare-fun lt!28327 () V!2909)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!65930 (= lt!28334 (tuple2!2087 (select (arr!1831 (_keys!3782 (v!2472 (underlying!248 thiss!992)))) from!355) lt!28327))))

(declare-fun lt!28328 () Unit!1829)

(declare-fun addCommutativeForDiffKeys!6 (ListLongMap!1399 (_ BitVec 64) V!2909 (_ BitVec 64) V!2909) Unit!1829)

(assert (=> b!65930 (= lt!28328 (addCommutativeForDiffKeys!6 lt!28330 (select (arr!1831 (_keys!3782 (v!2472 (underlying!248 thiss!992)))) from!355) lt!28327 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2050 (v!2472 (underlying!248 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!52 (array!3831 array!3833 (_ BitVec 32) (_ BitVec 32) V!2909 V!2909 (_ BitVec 32) Int) ListLongMap!1399)

(assert (=> b!65930 (= lt!28330 (getCurrentListMapNoExtraKeys!52 (_keys!3782 (v!2472 (underlying!248 thiss!992))) (_values!2125 (v!2472 (underlying!248 thiss!992))) (mask!6074 (v!2472 (underlying!248 thiss!992))) (extraKeys!2013 (v!2472 (underlying!248 thiss!992))) (zeroValue!2050 (v!2472 (underlying!248 thiss!992))) (minValue!2050 (v!2472 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2142 (v!2472 (underlying!248 thiss!992)))))))

(declare-fun b!65931 () Bool)

(declare-fun e!43254 () Bool)

(assert (=> b!65931 (= e!43254 e!43268)))

(declare-fun res!35778 () Bool)

(assert (=> b!65931 (=> (not res!35778) (not e!43268))))

(declare-datatypes ((tuple2!2088 0))(
  ( (tuple2!2089 (_1!1055 Bool) (_2!1055 LongMapFixedSize!668)) )
))
(declare-fun lt!28338 () tuple2!2088)

(assert (=> b!65931 (= res!35778 (and (_1!1055 lt!28338) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!28329 () Unit!1829)

(assert (=> b!65931 (= lt!28329 e!43262)))

(declare-fun c!9041 () Bool)

(declare-fun lt!28337 () ListLongMap!1399)

(declare-fun contains!707 (ListLongMap!1399 (_ BitVec 64)) Bool)

(assert (=> b!65931 (= c!9041 (contains!707 lt!28337 (select (arr!1831 (_keys!3782 (v!2472 (underlying!248 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!668)

(declare-fun update!88 (LongMapFixedSize!668 (_ BitVec 64) V!2909) tuple2!2088)

(assert (=> b!65931 (= lt!28338 (update!88 newMap!16 (select (arr!1831 (_keys!3782 (v!2472 (underlying!248 thiss!992)))) from!355) lt!28327))))

(declare-fun b!65933 () Bool)

(declare-fun e!43255 () Bool)

(declare-fun e!43269 () Bool)

(declare-fun mapRes!3060 () Bool)

(assert (=> b!65933 (= e!43255 (and e!43269 mapRes!3060))))

(declare-fun condMapEmpty!3059 () Bool)

(declare-fun mapDefault!3060 () ValueCell!880)

