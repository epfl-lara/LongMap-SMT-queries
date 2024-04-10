; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76030 () Bool)

(assert start!76030)

(declare-fun b!893855 () Bool)

(declare-fun b_free!15859 () Bool)

(declare-fun b_next!15859 () Bool)

(assert (=> b!893855 (= b_free!15859 (not b_next!15859))))

(declare-fun tp!55557 () Bool)

(declare-fun b_and!26133 () Bool)

(assert (=> b!893855 (= tp!55557 b_and!26133)))

(declare-fun mapNonEmpty!28846 () Bool)

(declare-fun mapRes!28846 () Bool)

(declare-fun tp!55556 () Bool)

(declare-fun e!499214 () Bool)

(assert (=> mapNonEmpty!28846 (= mapRes!28846 (and tp!55556 e!499214))))

(declare-datatypes ((array!52360 0))(
  ( (array!52361 (arr!25183 (Array (_ BitVec 32) (_ BitVec 64))) (size!25628 (_ BitVec 32))) )
))
(declare-datatypes ((V!29215 0))(
  ( (V!29216 (val!9144 Int)) )
))
(declare-datatypes ((ValueCell!8612 0))(
  ( (ValueCellFull!8612 (v!11628 V!29215)) (EmptyCell!8612) )
))
(declare-datatypes ((array!52362 0))(
  ( (array!52363 (arr!25184 (Array (_ BitVec 32) ValueCell!8612)) (size!25629 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4240 0))(
  ( (LongMapFixedSize!4241 (defaultEntry!5326 Int) (mask!25870 (_ BitVec 32)) (extraKeys!5022 (_ BitVec 32)) (zeroValue!5126 V!29215) (minValue!5126 V!29215) (_size!2175 (_ BitVec 32)) (_keys!10018 array!52360) (_values!5313 array!52362) (_vacant!2175 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4240)

(declare-fun mapKey!28846 () (_ BitVec 32))

(declare-fun mapRest!28846 () (Array (_ BitVec 32) ValueCell!8612))

(declare-fun mapValue!28846 () ValueCell!8612)

(assert (=> mapNonEmpty!28846 (= (arr!25184 (_values!5313 thiss!1181)) (store mapRest!28846 mapKey!28846 mapValue!28846))))

(declare-fun b!893848 () Bool)

(declare-fun e!499212 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!456 0))(
  ( (Some!455 (v!11629 V!29215)) (None!454) )
))
(declare-fun get!13261 (Option!456) V!29215)

(declare-datatypes ((tuple2!12020 0))(
  ( (tuple2!12021 (_1!6021 (_ BitVec 64)) (_2!6021 V!29215)) )
))
(declare-datatypes ((List!17800 0))(
  ( (Nil!17797) (Cons!17796 (h!18928 tuple2!12020) (t!25127 List!17800)) )
))
(declare-fun getValueByKey!450 (List!17800 (_ BitVec 64)) Option!456)

(declare-datatypes ((ListLongMap!10717 0))(
  ( (ListLongMap!10718 (toList!5374 List!17800)) )
))
(declare-fun map!12219 (LongMapFixedSize!4240) ListLongMap!10717)

(assert (=> b!893848 (= e!499212 (not (= (minValue!5126 thiss!1181) (get!13261 (getValueByKey!450 (toList!5374 (map!12219 thiss!1181)) key!785)))))))

(declare-fun b!893849 () Bool)

(declare-fun dynLambda!1298 (Int (_ BitVec 64)) V!29215)

(assert (=> b!893849 (= e!499212 (not (= (minValue!5126 thiss!1181) (dynLambda!1298 (defaultEntry!5326 thiss!1181) key!785))))))

(declare-fun mapIsEmpty!28846 () Bool)

(assert (=> mapIsEmpty!28846 mapRes!28846))

(declare-fun b!893850 () Bool)

(declare-fun e!499215 () Bool)

(declare-fun e!499209 () Bool)

(assert (=> b!893850 (= e!499215 (and e!499209 mapRes!28846))))

(declare-fun condMapEmpty!28846 () Bool)

(declare-fun mapDefault!28846 () ValueCell!8612)

