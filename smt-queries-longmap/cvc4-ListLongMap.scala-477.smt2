; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9756 () Bool)

(assert start!9756)

(declare-fun b!72943 () Bool)

(declare-fun b_free!2121 () Bool)

(declare-fun b_next!2121 () Bool)

(assert (=> b!72943 (= b_free!2121 (not b_next!2121))))

(declare-fun tp!8541 () Bool)

(declare-fun b_and!4483 () Bool)

(assert (=> b!72943 (= tp!8541 b_and!4483)))

(declare-fun b!72936 () Bool)

(declare-fun b_free!2123 () Bool)

(declare-fun b_next!2123 () Bool)

(assert (=> b!72936 (= b_free!2123 (not b_next!2123))))

(declare-fun tp!8540 () Bool)

(declare-fun b_and!4485 () Bool)

(assert (=> b!72936 (= tp!8540 b_and!4485)))

(declare-fun b!72933 () Bool)

(declare-fun e!47743 () Bool)

(declare-fun e!47741 () Bool)

(assert (=> b!72933 (= e!47743 e!47741)))

(declare-fun b!72934 () Bool)

(declare-fun e!47747 () Bool)

(assert (=> b!72934 (= e!47741 e!47747)))

(declare-fun b!72935 () Bool)

(declare-fun res!38727 () Bool)

(declare-fun e!47750 () Bool)

(assert (=> b!72935 (=> (not res!38727) (not e!47750))))

(declare-datatypes ((V!2949 0))(
  ( (V!2950 (val!1283 Int)) )
))
(declare-datatypes ((array!3899 0))(
  ( (array!3900 (arr!1861 (Array (_ BitVec 32) (_ BitVec 64))) (size!2099 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!895 0))(
  ( (ValueCellFull!895 (v!2531 V!2949)) (EmptyCell!895) )
))
(declare-datatypes ((array!3901 0))(
  ( (array!3902 (arr!1862 (Array (_ BitVec 32) ValueCell!895)) (size!2100 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!698 0))(
  ( (LongMapFixedSize!699 (defaultEntry!2214 Int) (mask!6181 (_ BitVec 32)) (extraKeys!2073 (_ BitVec 32)) (zeroValue!2116 V!2949) (minValue!2116 V!2949) (_size!398 (_ BitVec 32)) (_keys!3866 array!3899) (_values!2197 array!3901) (_vacant!398 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!698)

(declare-fun valid!291 (LongMapFixedSize!698) Bool)

(assert (=> b!72935 (= res!38727 (valid!291 newMap!16))))

(declare-fun tp_is_empty!2477 () Bool)

(declare-fun e!47742 () Bool)

(declare-fun e!47749 () Bool)

(declare-fun array_inv!1147 (array!3899) Bool)

(declare-fun array_inv!1148 (array!3901) Bool)

(assert (=> b!72936 (= e!47749 (and tp!8540 tp_is_empty!2477 (array_inv!1147 (_keys!3866 newMap!16)) (array_inv!1148 (_values!2197 newMap!16)) e!47742))))

(declare-fun b!72937 () Bool)

(declare-fun res!38725 () Bool)

(assert (=> b!72937 (=> (not res!38725) (not e!47750))))

(declare-datatypes ((Cell!500 0))(
  ( (Cell!501 (v!2532 LongMapFixedSize!698)) )
))
(declare-datatypes ((LongMap!500 0))(
  ( (LongMap!501 (underlying!261 Cell!500)) )
))
(declare-fun thiss!992 () LongMap!500)

(assert (=> b!72937 (= res!38725 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6181 newMap!16)) (_size!398 (v!2532 (underlying!261 thiss!992)))))))

(declare-fun b!72938 () Bool)

(declare-fun res!38728 () Bool)

(assert (=> b!72938 (=> (not res!38728) (not e!47750))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!72938 (= res!38728 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2099 (_keys!3866 (v!2532 (underlying!261 thiss!992)))))))))

(declare-fun mapNonEmpty!3177 () Bool)

(declare-fun mapRes!3177 () Bool)

(declare-fun tp!8539 () Bool)

(declare-fun e!47736 () Bool)

(assert (=> mapNonEmpty!3177 (= mapRes!3177 (and tp!8539 e!47736))))

(declare-fun mapRest!3177 () (Array (_ BitVec 32) ValueCell!895))

(declare-fun mapKey!3177 () (_ BitVec 32))

(declare-fun mapValue!3178 () ValueCell!895)

(assert (=> mapNonEmpty!3177 (= (arr!1862 (_values!2197 (v!2532 (underlying!261 thiss!992)))) (store mapRest!3177 mapKey!3177 mapValue!3178))))

(declare-fun b!72939 () Bool)

(declare-fun e!47745 () Bool)

(declare-fun mapRes!3178 () Bool)

(assert (=> b!72939 (= e!47742 (and e!47745 mapRes!3178))))

(declare-fun condMapEmpty!3177 () Bool)

(declare-fun mapDefault!3178 () ValueCell!895)

