; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40950 () Bool)

(assert start!40950)

(declare-fun b_free!10885 () Bool)

(declare-fun b_next!10885 () Bool)

(assert (=> start!40950 (= b_free!10885 (not b_next!10885))))

(declare-fun tp!38481 () Bool)

(declare-fun b_and!19027 () Bool)

(assert (=> start!40950 (= tp!38481 b_and!19027)))

(declare-fun b!455537 () Bool)

(declare-fun e!266318 () Bool)

(declare-fun tp_is_empty!12223 () Bool)

(assert (=> b!455537 (= e!266318 tp_is_empty!12223)))

(declare-fun b!455538 () Bool)

(declare-fun res!271646 () Bool)

(declare-fun e!266321 () Bool)

(assert (=> b!455538 (=> (not res!271646) (not e!266321))))

(declare-datatypes ((array!28249 0))(
  ( (array!28250 (arr!13568 (Array (_ BitVec 32) (_ BitVec 64))) (size!13920 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28249)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455538 (= res!271646 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!271654 () Bool)

(assert (=> start!40950 (=> (not res!271654) (not e!266321))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40950 (= res!271654 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13920 _keys!709))))))

(assert (=> start!40950 e!266321))

(assert (=> start!40950 tp_is_empty!12223))

(assert (=> start!40950 tp!38481))

(assert (=> start!40950 true))

(declare-datatypes ((V!17403 0))(
  ( (V!17404 (val!6156 Int)) )
))
(declare-datatypes ((ValueCell!5768 0))(
  ( (ValueCellFull!5768 (v!8422 V!17403)) (EmptyCell!5768) )
))
(declare-datatypes ((array!28251 0))(
  ( (array!28252 (arr!13569 (Array (_ BitVec 32) ValueCell!5768)) (size!13921 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28251)

(declare-fun e!266322 () Bool)

(declare-fun array_inv!9830 (array!28251) Bool)

(assert (=> start!40950 (and (array_inv!9830 _values!549) e!266322)))

(declare-fun array_inv!9831 (array!28249) Bool)

(assert (=> start!40950 (array_inv!9831 _keys!709)))

(declare-fun b!455539 () Bool)

(declare-fun res!271648 () Bool)

(assert (=> b!455539 (=> (not res!271648) (not e!266321))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455539 (= res!271648 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13920 _keys!709))))))

(declare-fun mapIsEmpty!19975 () Bool)

(declare-fun mapRes!19975 () Bool)

(assert (=> mapIsEmpty!19975 mapRes!19975))

(declare-fun b!455540 () Bool)

(declare-fun res!271649 () Bool)

(declare-fun e!266320 () Bool)

(assert (=> b!455540 (=> (not res!271649) (not e!266320))))

(declare-fun lt!206355 () array!28249)

(declare-datatypes ((List!8178 0))(
  ( (Nil!8175) (Cons!8174 (h!9030 (_ BitVec 64)) (t!14006 List!8178)) )
))
(declare-fun arrayNoDuplicates!0 (array!28249 (_ BitVec 32) List!8178) Bool)

(assert (=> b!455540 (= res!271649 (arrayNoDuplicates!0 lt!206355 #b00000000000000000000000000000000 Nil!8175))))

(declare-fun b!455541 () Bool)

(declare-fun res!271644 () Bool)

(assert (=> b!455541 (=> (not res!271644) (not e!266320))))

(assert (=> b!455541 (= res!271644 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19975 () Bool)

(declare-fun tp!38482 () Bool)

(assert (=> mapNonEmpty!19975 (= mapRes!19975 (and tp!38482 e!266318))))

(declare-fun mapKey!19975 () (_ BitVec 32))

(declare-fun mapRest!19975 () (Array (_ BitVec 32) ValueCell!5768))

(declare-fun mapValue!19975 () ValueCell!5768)

(assert (=> mapNonEmpty!19975 (= (arr!13569 _values!549) (store mapRest!19975 mapKey!19975 mapValue!19975))))

(declare-fun b!455542 () Bool)

(declare-fun res!271645 () Bool)

(assert (=> b!455542 (=> (not res!271645) (not e!266321))))

(assert (=> b!455542 (= res!271645 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8175))))

(declare-fun b!455543 () Bool)

(declare-fun e!266319 () Bool)

(assert (=> b!455543 (= e!266322 (and e!266319 mapRes!19975))))

(declare-fun condMapEmpty!19975 () Bool)

(declare-fun mapDefault!19975 () ValueCell!5768)

