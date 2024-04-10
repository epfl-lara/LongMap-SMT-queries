; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39758 () Bool)

(assert start!39758)

(declare-fun b_free!10025 () Bool)

(declare-fun b_next!10025 () Bool)

(assert (=> start!39758 (= b_free!10025 (not b_next!10025))))

(declare-fun tp!35603 () Bool)

(declare-fun b_and!17709 () Bool)

(assert (=> start!39758 (= tp!35603 b_and!17709)))

(declare-fun b!428096 () Bool)

(declare-fun res!251234 () Bool)

(declare-fun e!253742 () Bool)

(assert (=> b!428096 (=> (not res!251234) (not e!253742))))

(declare-datatypes ((array!26191 0))(
  ( (array!26192 (arr!12545 (Array (_ BitVec 32) (_ BitVec 64))) (size!12897 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26191)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26191 (_ BitVec 32)) Bool)

(assert (=> b!428096 (= res!251234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428097 () Bool)

(declare-fun e!253744 () Bool)

(declare-fun tp_is_empty!11177 () Bool)

(assert (=> b!428097 (= e!253744 tp_is_empty!11177)))

(declare-fun res!251235 () Bool)

(assert (=> start!39758 (=> (not res!251235) (not e!253742))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39758 (= res!251235 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12897 _keys!709))))))

(assert (=> start!39758 e!253742))

(assert (=> start!39758 tp_is_empty!11177))

(assert (=> start!39758 tp!35603))

(assert (=> start!39758 true))

(declare-datatypes ((V!16007 0))(
  ( (V!16008 (val!5633 Int)) )
))
(declare-datatypes ((ValueCell!5245 0))(
  ( (ValueCellFull!5245 (v!7880 V!16007)) (EmptyCell!5245) )
))
(declare-datatypes ((array!26193 0))(
  ( (array!26194 (arr!12546 (Array (_ BitVec 32) ValueCell!5245)) (size!12898 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26193)

(declare-fun e!253749 () Bool)

(declare-fun array_inv!9146 (array!26193) Bool)

(assert (=> start!39758 (and (array_inv!9146 _values!549) e!253749)))

(declare-fun array_inv!9147 (array!26191) Bool)

(assert (=> start!39758 (array_inv!9147 _keys!709)))

(declare-fun b!428098 () Bool)

(declare-fun e!253747 () Bool)

(declare-fun e!253745 () Bool)

(assert (=> b!428098 (= e!253747 e!253745)))

(declare-fun res!251236 () Bool)

(assert (=> b!428098 (=> (not res!251236) (not e!253745))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428098 (= res!251236 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16007)

(declare-fun minValue!515 () V!16007)

(declare-fun lt!195588 () array!26191)

(declare-fun lt!195587 () array!26193)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7410 0))(
  ( (tuple2!7411 (_1!3716 (_ BitVec 64)) (_2!3716 V!16007)) )
))
(declare-datatypes ((List!7424 0))(
  ( (Nil!7421) (Cons!7420 (h!8276 tuple2!7410) (t!12898 List!7424)) )
))
(declare-datatypes ((ListLongMap!6323 0))(
  ( (ListLongMap!6324 (toList!3177 List!7424)) )
))
(declare-fun lt!195589 () ListLongMap!6323)

(declare-fun getCurrentListMapNoExtraKeys!1379 (array!26191 array!26193 (_ BitVec 32) (_ BitVec 32) V!16007 V!16007 (_ BitVec 32) Int) ListLongMap!6323)

(assert (=> b!428098 (= lt!195589 (getCurrentListMapNoExtraKeys!1379 lt!195588 lt!195587 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16007)

(assert (=> b!428098 (= lt!195587 (array!26194 (store (arr!12546 _values!549) i!563 (ValueCellFull!5245 v!412)) (size!12898 _values!549)))))

(declare-fun lt!195586 () ListLongMap!6323)

(assert (=> b!428098 (= lt!195586 (getCurrentListMapNoExtraKeys!1379 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428099 () Bool)

(declare-fun res!251233 () Bool)

(assert (=> b!428099 (=> (not res!251233) (not e!253742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428099 (= res!251233 (validMask!0 mask!1025))))

(declare-fun b!428100 () Bool)

(declare-fun mapRes!18387 () Bool)

(assert (=> b!428100 (= e!253749 (and e!253744 mapRes!18387))))

(declare-fun condMapEmpty!18387 () Bool)

(declare-fun mapDefault!18387 () ValueCell!5245)

