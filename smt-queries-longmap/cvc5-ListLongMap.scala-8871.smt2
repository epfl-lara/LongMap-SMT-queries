; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107688 () Bool)

(assert start!107688)

(declare-fun b!1274203 () Bool)

(declare-fun b_free!27769 () Bool)

(declare-fun b_next!27769 () Bool)

(assert (=> b!1274203 (= b_free!27769 (not b_next!27769))))

(declare-fun tp!97877 () Bool)

(declare-fun b_and!45825 () Bool)

(assert (=> b!1274203 (= tp!97877 b_and!45825)))

(declare-fun b!1274195 () Bool)

(declare-fun e!727122 () Bool)

(declare-fun tp_is_empty!33139 () Bool)

(assert (=> b!1274195 (= e!727122 tp_is_empty!33139)))

(declare-fun b!1274196 () Bool)

(declare-fun res!847154 () Bool)

(declare-fun e!727123 () Bool)

(assert (=> b!1274196 (=> (not res!847154) (not e!727123))))

(declare-datatypes ((V!49379 0))(
  ( (V!49380 (val!16644 Int)) )
))
(declare-datatypes ((ValueCell!15716 0))(
  ( (ValueCellFull!15716 (v!19281 V!49379)) (EmptyCell!15716) )
))
(declare-datatypes ((array!83564 0))(
  ( (array!83565 (arr!40300 (Array (_ BitVec 32) ValueCell!15716)) (size!40849 (_ BitVec 32))) )
))
(declare-datatypes ((array!83566 0))(
  ( (array!83567 (arr!40301 (Array (_ BitVec 32) (_ BitVec 64))) (size!40850 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6196 0))(
  ( (LongMapFixedSize!6197 (defaultEntry!6744 Int) (mask!34550 (_ BitVec 32)) (extraKeys!6423 (_ BitVec 32)) (zeroValue!6529 V!49379) (minValue!6529 V!49379) (_size!3153 (_ BitVec 32)) (_keys!12162 array!83566) (_values!6767 array!83564) (_vacant!3153 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6196)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83566 (_ BitVec 32)) Bool)

(assert (=> b!1274196 (= res!847154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12162 thiss!1551) (mask!34550 thiss!1551)))))

(declare-fun b!1274197 () Bool)

(declare-fun res!847149 () Bool)

(assert (=> b!1274197 (=> (not res!847149) (not e!727123))))

(assert (=> b!1274197 (= res!847149 (and (bvsle #b00000000000000000000000000000000 (size!40850 (_keys!12162 thiss!1551))) (bvslt (size!40850 (_keys!12162 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1274198 () Bool)

(declare-fun res!847151 () Bool)

(assert (=> b!1274198 (=> (not res!847151) (not e!727123))))

(declare-datatypes ((List!28570 0))(
  ( (Nil!28567) (Cons!28566 (h!29775 (_ BitVec 64)) (t!42103 List!28570)) )
))
(declare-fun noDuplicate!2047 (List!28570) Bool)

(assert (=> b!1274198 (= res!847151 (noDuplicate!2047 Nil!28567))))

(declare-fun b!1274199 () Bool)

(declare-fun e!727124 () Bool)

(declare-fun contains!7676 (List!28570 (_ BitVec 64)) Bool)

(assert (=> b!1274199 (= e!727124 (contains!7676 Nil!28567 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!51353 () Bool)

(declare-fun mapRes!51353 () Bool)

(assert (=> mapIsEmpty!51353 mapRes!51353))

(declare-fun res!847153 () Bool)

(assert (=> start!107688 (=> (not res!847153) (not e!727123))))

(declare-fun simpleValid!482 (LongMapFixedSize!6196) Bool)

(assert (=> start!107688 (= res!847153 (simpleValid!482 thiss!1551))))

(assert (=> start!107688 e!727123))

(declare-fun e!727126 () Bool)

(assert (=> start!107688 e!727126))

(declare-fun b!1274200 () Bool)

(assert (=> b!1274200 (= e!727123 e!727124)))

(declare-fun res!847150 () Bool)

(assert (=> b!1274200 (=> res!847150 e!727124)))

(assert (=> b!1274200 (= res!847150 (contains!7676 Nil!28567 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1274201 () Bool)

(declare-fun e!727121 () Bool)

(assert (=> b!1274201 (= e!727121 tp_is_empty!33139)))

(declare-fun b!1274202 () Bool)

(declare-fun e!727127 () Bool)

(assert (=> b!1274202 (= e!727127 (and e!727122 mapRes!51353))))

(declare-fun condMapEmpty!51353 () Bool)

(declare-fun mapDefault!51353 () ValueCell!15716)

