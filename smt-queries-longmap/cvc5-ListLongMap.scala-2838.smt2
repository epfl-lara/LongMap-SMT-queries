; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40992 () Bool)

(assert start!40992)

(declare-fun b_free!10927 () Bool)

(declare-fun b_next!10927 () Bool)

(assert (=> start!40992 (= b_free!10927 (not b_next!10927))))

(declare-fun tp!38608 () Bool)

(declare-fun b_and!19069 () Bool)

(assert (=> start!40992 (= tp!38608 b_and!19069)))

(declare-fun mapNonEmpty!20038 () Bool)

(declare-fun mapRes!20038 () Bool)

(declare-fun tp!38607 () Bool)

(declare-fun e!266710 () Bool)

(assert (=> mapNonEmpty!20038 (= mapRes!20038 (and tp!38607 e!266710))))

(declare-datatypes ((V!17459 0))(
  ( (V!17460 (val!6177 Int)) )
))
(declare-datatypes ((ValueCell!5789 0))(
  ( (ValueCellFull!5789 (v!8443 V!17459)) (EmptyCell!5789) )
))
(declare-datatypes ((array!28333 0))(
  ( (array!28334 (arr!13610 (Array (_ BitVec 32) ValueCell!5789)) (size!13962 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28333)

(declare-fun mapRest!20038 () (Array (_ BitVec 32) ValueCell!5789))

(declare-fun mapValue!20038 () ValueCell!5789)

(declare-fun mapKey!20038 () (_ BitVec 32))

(assert (=> mapNonEmpty!20038 (= (arr!13610 _values!549) (store mapRest!20038 mapKey!20038 mapValue!20038))))

(declare-fun b!456493 () Bool)

(declare-fun res!272414 () Bool)

(declare-fun e!266712 () Bool)

(assert (=> b!456493 (=> (not res!272414) (not e!266712))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456493 (= res!272414 (validMask!0 mask!1025))))

(declare-fun b!456494 () Bool)

(declare-fun res!272421 () Bool)

(assert (=> b!456494 (=> (not res!272421) (not e!266712))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28335 0))(
  ( (array!28336 (arr!13611 (Array (_ BitVec 32) (_ BitVec 64))) (size!13963 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28335)

(assert (=> b!456494 (= res!272421 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13963 _keys!709))))))

(declare-fun b!456495 () Bool)

(declare-fun e!266713 () Bool)

(declare-fun e!266711 () Bool)

(assert (=> b!456495 (= e!266713 (and e!266711 mapRes!20038))))

(declare-fun condMapEmpty!20038 () Bool)

(declare-fun mapDefault!20038 () ValueCell!5789)

