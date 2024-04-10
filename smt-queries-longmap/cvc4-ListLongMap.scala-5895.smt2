; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76146 () Bool)

(assert start!76146)

(declare-fun b!894529 () Bool)

(declare-fun b_free!15875 () Bool)

(declare-fun b_next!15875 () Bool)

(assert (=> b!894529 (= b_free!15875 (not b_next!15875))))

(declare-fun tp!55613 () Bool)

(declare-fun b_and!26167 () Bool)

(assert (=> b!894529 (= tp!55613 b_and!26167)))

(declare-fun mapNonEmpty!28878 () Bool)

(declare-fun mapRes!28878 () Bool)

(declare-fun tp!55612 () Bool)

(declare-fun e!499661 () Bool)

(assert (=> mapNonEmpty!28878 (= mapRes!28878 (and tp!55612 e!499661))))

(declare-datatypes ((V!29235 0))(
  ( (V!29236 (val!9152 Int)) )
))
(declare-datatypes ((ValueCell!8620 0))(
  ( (ValueCellFull!8620 (v!11642 V!29235)) (EmptyCell!8620) )
))
(declare-fun mapValue!28878 () ValueCell!8620)

(declare-fun mapKey!28878 () (_ BitVec 32))

(declare-datatypes ((array!52396 0))(
  ( (array!52397 (arr!25199 (Array (_ BitVec 32) (_ BitVec 64))) (size!25645 (_ BitVec 32))) )
))
(declare-datatypes ((array!52398 0))(
  ( (array!52399 (arr!25200 (Array (_ BitVec 32) ValueCell!8620)) (size!25646 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4256 0))(
  ( (LongMapFixedSize!4257 (defaultEntry!5340 Int) (mask!25899 (_ BitVec 32)) (extraKeys!5036 (_ BitVec 32)) (zeroValue!5140 V!29235) (minValue!5140 V!29235) (_size!2183 (_ BitVec 32)) (_keys!10037 array!52396) (_values!5327 array!52398) (_vacant!2183 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4256)

(declare-fun mapRest!28878 () (Array (_ BitVec 32) ValueCell!8620))

(assert (=> mapNonEmpty!28878 (= (arr!25200 (_values!5327 thiss!1181)) (store mapRest!28878 mapKey!28878 mapValue!28878))))

(declare-fun mapIsEmpty!28878 () Bool)

(assert (=> mapIsEmpty!28878 mapRes!28878))

(declare-fun e!499659 () Bool)

(declare-fun tp_is_empty!18203 () Bool)

(declare-fun e!499660 () Bool)

(declare-fun array_inv!19784 (array!52396) Bool)

(declare-fun array_inv!19785 (array!52398) Bool)

(assert (=> b!894529 (= e!499660 (and tp!55613 tp_is_empty!18203 (array_inv!19784 (_keys!10037 thiss!1181)) (array_inv!19785 (_values!5327 thiss!1181)) e!499659))))

(declare-fun b!894530 () Bool)

(assert (=> b!894530 (= e!499661 tp_is_empty!18203)))

(declare-fun b!894531 () Bool)

(declare-fun res!605373 () Bool)

(declare-fun e!499662 () Bool)

(assert (=> b!894531 (=> (not res!605373) (not e!499662))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!894531 (= res!605373 (not (= key!785 (bvneg key!785))))))

(declare-fun b!894532 () Bool)

(declare-fun e!499658 () Bool)

(assert (=> b!894532 (= e!499659 (and e!499658 mapRes!28878))))

(declare-fun condMapEmpty!28878 () Bool)

(declare-fun mapDefault!28878 () ValueCell!8620)

