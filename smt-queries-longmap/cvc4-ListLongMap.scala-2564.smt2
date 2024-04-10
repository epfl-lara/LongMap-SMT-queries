; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39206 () Bool)

(assert start!39206)

(declare-fun b_free!9473 () Bool)

(declare-fun b_next!9473 () Bool)

(assert (=> start!39206 (= b_free!9473 (not b_next!9473))))

(declare-fun tp!33947 () Bool)

(declare-fun b_and!16859 () Bool)

(assert (=> start!39206 (= tp!33947 b_and!16859)))

(declare-fun b!413325 () Bool)

(declare-fun res!240166 () Bool)

(declare-fun e!247187 () Bool)

(assert (=> b!413325 (=> (not res!240166) (not e!247187))))

(declare-datatypes ((array!25107 0))(
  ( (array!25108 (arr!12003 (Array (_ BitVec 32) (_ BitVec 64))) (size!12355 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25107)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15271 0))(
  ( (V!15272 (val!5357 Int)) )
))
(declare-datatypes ((ValueCell!4969 0))(
  ( (ValueCellFull!4969 (v!7604 V!15271)) (EmptyCell!4969) )
))
(declare-datatypes ((array!25109 0))(
  ( (array!25110 (arr!12004 (Array (_ BitVec 32) ValueCell!4969)) (size!12356 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25109)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!413325 (= res!240166 (and (= (size!12356 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12355 _keys!709) (size!12356 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun e!247181 () Bool)

(declare-datatypes ((tuple2!6958 0))(
  ( (tuple2!6959 (_1!3490 (_ BitVec 64)) (_2!3490 V!15271)) )
))
(declare-datatypes ((List!6983 0))(
  ( (Nil!6980) (Cons!6979 (h!7835 tuple2!6958) (t!12157 List!6983)) )
))
(declare-datatypes ((ListLongMap!5871 0))(
  ( (ListLongMap!5872 (toList!2951 List!6983)) )
))
(declare-fun call!28597 () ListLongMap!5871)

(declare-fun call!28598 () ListLongMap!5871)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun b!413326 () Bool)

(declare-fun v!412 () V!15271)

(declare-fun +!1163 (ListLongMap!5871 tuple2!6958) ListLongMap!5871)

(assert (=> b!413326 (= e!247181 (= call!28597 (+!1163 call!28598 (tuple2!6959 k!794 v!412))))))

(declare-fun b!413327 () Bool)

(declare-fun e!247184 () Bool)

(assert (=> b!413327 (= e!247184 (not true))))

(assert (=> b!413327 e!247181))

(declare-fun c!54923 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413327 (= c!54923 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15271)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((Unit!12232 0))(
  ( (Unit!12233) )
))
(declare-fun lt!189696 () Unit!12232)

(declare-fun zeroValue!515 () V!15271)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!374 (array!25107 array!25109 (_ BitVec 32) (_ BitVec 32) V!15271 V!15271 (_ BitVec 32) (_ BitVec 64) V!15271 (_ BitVec 32) Int) Unit!12232)

(assert (=> b!413327 (= lt!189696 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!374 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!240167 () Bool)

(assert (=> start!39206 (=> (not res!240167) (not e!247187))))

(assert (=> start!39206 (= res!240167 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12355 _keys!709))))))

(assert (=> start!39206 e!247187))

(declare-fun tp_is_empty!10625 () Bool)

(assert (=> start!39206 tp_is_empty!10625))

(assert (=> start!39206 tp!33947))

(assert (=> start!39206 true))

(declare-fun e!247186 () Bool)

(declare-fun array_inv!8754 (array!25109) Bool)

(assert (=> start!39206 (and (array_inv!8754 _values!549) e!247186)))

(declare-fun array_inv!8755 (array!25107) Bool)

(assert (=> start!39206 (array_inv!8755 _keys!709)))

(declare-fun b!413328 () Bool)

(declare-fun res!240170 () Bool)

(declare-fun e!247185 () Bool)

(assert (=> b!413328 (=> (not res!240170) (not e!247185))))

(declare-fun lt!189694 () array!25107)

(declare-datatypes ((List!6984 0))(
  ( (Nil!6981) (Cons!6980 (h!7836 (_ BitVec 64)) (t!12158 List!6984)) )
))
(declare-fun arrayNoDuplicates!0 (array!25107 (_ BitVec 32) List!6984) Bool)

(assert (=> b!413328 (= res!240170 (arrayNoDuplicates!0 lt!189694 #b00000000000000000000000000000000 Nil!6981))))

(declare-fun b!413329 () Bool)

(declare-fun res!240163 () Bool)

(assert (=> b!413329 (=> (not res!240163) (not e!247187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413329 (= res!240163 (validKeyInArray!0 k!794))))

(declare-fun b!413330 () Bool)

(declare-fun res!240162 () Bool)

(assert (=> b!413330 (=> (not res!240162) (not e!247187))))

(assert (=> b!413330 (= res!240162 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6981))))

(declare-fun b!413331 () Bool)

(declare-fun res!240168 () Bool)

(assert (=> b!413331 (=> (not res!240168) (not e!247187))))

(assert (=> b!413331 (= res!240168 (or (= (select (arr!12003 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12003 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17559 () Bool)

(declare-fun mapRes!17559 () Bool)

(declare-fun tp!33948 () Bool)

(declare-fun e!247183 () Bool)

(assert (=> mapNonEmpty!17559 (= mapRes!17559 (and tp!33948 e!247183))))

(declare-fun mapValue!17559 () ValueCell!4969)

(declare-fun mapKey!17559 () (_ BitVec 32))

(declare-fun mapRest!17559 () (Array (_ BitVec 32) ValueCell!4969))

(assert (=> mapNonEmpty!17559 (= (arr!12004 _values!549) (store mapRest!17559 mapKey!17559 mapValue!17559))))

(declare-fun b!413332 () Bool)

(declare-fun res!240165 () Bool)

(assert (=> b!413332 (=> (not res!240165) (not e!247187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25107 (_ BitVec 32)) Bool)

(assert (=> b!413332 (= res!240165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413333 () Bool)

(declare-fun res!240171 () Bool)

(assert (=> b!413333 (=> (not res!240171) (not e!247187))))

(declare-fun arrayContainsKey!0 (array!25107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413333 (= res!240171 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun lt!189697 () array!25109)

(declare-fun bm!28594 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1159 (array!25107 array!25109 (_ BitVec 32) (_ BitVec 32) V!15271 V!15271 (_ BitVec 32) Int) ListLongMap!5871)

(assert (=> bm!28594 (= call!28597 (getCurrentListMapNoExtraKeys!1159 (ite c!54923 lt!189694 _keys!709) (ite c!54923 lt!189697 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413334 () Bool)

(assert (=> b!413334 (= e!247185 e!247184)))

(declare-fun res!240172 () Bool)

(assert (=> b!413334 (=> (not res!240172) (not e!247184))))

(assert (=> b!413334 (= res!240172 (= from!863 i!563))))

(declare-fun lt!189695 () ListLongMap!5871)

(assert (=> b!413334 (= lt!189695 (getCurrentListMapNoExtraKeys!1159 lt!189694 lt!189697 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413334 (= lt!189697 (array!25110 (store (arr!12004 _values!549) i!563 (ValueCellFull!4969 v!412)) (size!12356 _values!549)))))

(declare-fun lt!189698 () ListLongMap!5871)

(assert (=> b!413334 (= lt!189698 (getCurrentListMapNoExtraKeys!1159 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413335 () Bool)

(declare-fun res!240173 () Bool)

(assert (=> b!413335 (=> (not res!240173) (not e!247187))))

(assert (=> b!413335 (= res!240173 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12355 _keys!709))))))

(declare-fun b!413336 () Bool)

(declare-fun e!247182 () Bool)

(assert (=> b!413336 (= e!247186 (and e!247182 mapRes!17559))))

(declare-fun condMapEmpty!17559 () Bool)

(declare-fun mapDefault!17559 () ValueCell!4969)

