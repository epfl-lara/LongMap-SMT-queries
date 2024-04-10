; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16806 () Bool)

(assert start!16806)

(declare-fun b!169350 () Bool)

(declare-fun b_free!4123 () Bool)

(declare-fun b_next!4123 () Bool)

(assert (=> b!169350 (= b_free!4123 (not b_next!4123))))

(declare-fun tp!14974 () Bool)

(declare-fun b_and!10537 () Bool)

(assert (=> b!169350 (= tp!14974 b_and!10537)))

(declare-fun b!169344 () Bool)

(declare-fun b_free!4125 () Bool)

(declare-fun b_next!4125 () Bool)

(assert (=> b!169344 (= b_free!4125 (not b_next!4125))))

(declare-fun tp!14973 () Bool)

(declare-fun b_and!10539 () Bool)

(assert (=> b!169344 (= tp!14973 b_and!10539)))

(declare-fun b!169341 () Bool)

(declare-fun e!111566 () Bool)

(assert (=> b!169341 (= e!111566 false)))

(declare-fun lt!84894 () Bool)

(declare-datatypes ((V!4865 0))(
  ( (V!4866 (val!2001 Int)) )
))
(declare-datatypes ((ValueCell!1613 0))(
  ( (ValueCellFull!1613 (v!3866 V!4865)) (EmptyCell!1613) )
))
(declare-datatypes ((array!6923 0))(
  ( (array!6924 (arr!3297 (Array (_ BitVec 32) (_ BitVec 64))) (size!3585 (_ BitVec 32))) )
))
(declare-datatypes ((array!6925 0))(
  ( (array!6926 (arr!3298 (Array (_ BitVec 32) ValueCell!1613)) (size!3586 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2134 0))(
  ( (LongMapFixedSize!2135 (defaultEntry!3509 Int) (mask!8292 (_ BitVec 32)) (extraKeys!3250 (_ BitVec 32)) (zeroValue!3352 V!4865) (minValue!3352 V!4865) (_size!1116 (_ BitVec 32)) (_keys!5334 array!6923) (_values!3492 array!6925) (_vacant!1116 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3210 0))(
  ( (tuple2!3211 (_1!1616 Bool) (_2!1616 LongMapFixedSize!2134)) )
))
(declare-fun lt!84893 () tuple2!3210)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3212 0))(
  ( (tuple2!3213 (_1!1617 (_ BitVec 64)) (_2!1617 V!4865)) )
))
(declare-datatypes ((List!2181 0))(
  ( (Nil!2178) (Cons!2177 (h!2794 tuple2!3212) (t!6983 List!2181)) )
))
(declare-datatypes ((ListLongMap!2155 0))(
  ( (ListLongMap!2156 (toList!1093 List!2181)) )
))
(declare-fun contains!1135 (ListLongMap!2155 (_ BitVec 64)) Bool)

(declare-fun map!1820 (LongMapFixedSize!2134) ListLongMap!2155)

(assert (=> b!169341 (= lt!84894 (contains!1135 (map!1820 (_2!1616 lt!84893)) key!828))))

(declare-fun b!169342 () Bool)

(declare-fun e!111561 () Bool)

(declare-fun tp_is_empty!3913 () Bool)

(assert (=> b!169342 (= e!111561 tp_is_empty!3913)))

(declare-fun b!169343 () Bool)

(declare-fun e!111563 () Bool)

(declare-fun e!111564 () Bool)

(declare-fun mapRes!6608 () Bool)

(assert (=> b!169343 (= e!111563 (and e!111564 mapRes!6608))))

(declare-fun condMapEmpty!6609 () Bool)

(declare-fun thiss!1248 () LongMapFixedSize!2134)

(declare-fun mapDefault!6608 () ValueCell!1613)

