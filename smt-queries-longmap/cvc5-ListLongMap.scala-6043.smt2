; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78158 () Bool)

(assert start!78158)

(declare-fun b_free!16669 () Bool)

(declare-fun b_next!16669 () Bool)

(assert (=> start!78158 (= b_free!16669 (not b_next!16669))))

(declare-fun tp!58281 () Bool)

(declare-fun b_and!27243 () Bool)

(assert (=> start!78158 (= tp!58281 b_and!27243)))

(declare-fun b!912172 () Bool)

(declare-fun res!615349 () Bool)

(declare-fun e!511676 () Bool)

(assert (=> b!912172 (=> (not res!615349) (not e!511676))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912172 (= res!615349 (inRange!0 i!717 mask!1756))))

(declare-fun b!912173 () Bool)

(declare-fun res!615350 () Bool)

(assert (=> b!912173 (=> (not res!615350) (not e!511676))))

(declare-datatypes ((V!30415 0))(
  ( (V!30416 (val!9594 Int)) )
))
(declare-datatypes ((ValueCell!9062 0))(
  ( (ValueCellFull!9062 (v!12104 V!30415)) (EmptyCell!9062) )
))
(declare-datatypes ((array!54168 0))(
  ( (array!54169 (arr!26039 (Array (_ BitVec 32) ValueCell!9062)) (size!26498 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54168)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!54170 0))(
  ( (array!54171 (arr!26040 (Array (_ BitVec 32) (_ BitVec 64))) (size!26499 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54170)

(assert (=> b!912173 (= res!615350 (and (= (size!26498 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26499 _keys!1386) (size!26498 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615345 () Bool)

(assert (=> start!78158 (=> (not res!615345) (not e!511676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78158 (= res!615345 (validMask!0 mask!1756))))

(assert (=> start!78158 e!511676))

(declare-fun e!511675 () Bool)

(declare-fun array_inv!20346 (array!54168) Bool)

(assert (=> start!78158 (and (array_inv!20346 _values!1152) e!511675)))

(assert (=> start!78158 tp!58281))

(assert (=> start!78158 true))

(declare-fun tp_is_empty!19087 () Bool)

(assert (=> start!78158 tp_is_empty!19087))

(declare-fun array_inv!20347 (array!54170) Bool)

(assert (=> start!78158 (array_inv!20347 _keys!1386)))

(declare-fun b!912174 () Bool)

(declare-fun res!615346 () Bool)

(assert (=> b!912174 (=> (not res!615346) (not e!511676))))

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!912174 (= res!615346 (and (= (select (arr!26040 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!30355 () Bool)

(declare-fun mapRes!30355 () Bool)

(declare-fun tp!58280 () Bool)

(declare-fun e!511674 () Bool)

(assert (=> mapNonEmpty!30355 (= mapRes!30355 (and tp!58280 e!511674))))

(declare-fun mapValue!30355 () ValueCell!9062)

(declare-fun mapRest!30355 () (Array (_ BitVec 32) ValueCell!9062))

(declare-fun mapKey!30355 () (_ BitVec 32))

(assert (=> mapNonEmpty!30355 (= (arr!26039 _values!1152) (store mapRest!30355 mapKey!30355 mapValue!30355))))

(declare-fun b!912175 () Bool)

(assert (=> b!912175 (= e!511674 tp_is_empty!19087)))

(declare-fun b!912176 () Bool)

(declare-fun res!615351 () Bool)

(assert (=> b!912176 (=> (not res!615351) (not e!511676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54170 (_ BitVec 32)) Bool)

(assert (=> b!912176 (= res!615351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912177 () Bool)

(assert (=> b!912177 (= e!511676 (not (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26498 _values!1152)))))))

(declare-fun arrayContainsKey!0 (array!54170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912177 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30415)

(declare-datatypes ((Unit!30866 0))(
  ( (Unit!30867) )
))
(declare-fun lt!410564 () Unit!30866)

(declare-fun minValue!1094 () V!30415)

(declare-fun lemmaKeyInListMapIsInArray!259 (array!54170 array!54168 (_ BitVec 32) (_ BitVec 32) V!30415 V!30415 (_ BitVec 64) Int) Unit!30866)

(assert (=> b!912177 (= lt!410564 (lemmaKeyInListMapIsInArray!259 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912178 () Bool)

(declare-fun e!511677 () Bool)

(assert (=> b!912178 (= e!511677 tp_is_empty!19087)))

(declare-fun b!912179 () Bool)

(declare-fun res!615347 () Bool)

(assert (=> b!912179 (=> (not res!615347) (not e!511676))))

(declare-datatypes ((tuple2!12500 0))(
  ( (tuple2!12501 (_1!6261 (_ BitVec 64)) (_2!6261 V!30415)) )
))
(declare-datatypes ((List!18290 0))(
  ( (Nil!18287) (Cons!18286 (h!19432 tuple2!12500) (t!25877 List!18290)) )
))
(declare-datatypes ((ListLongMap!11197 0))(
  ( (ListLongMap!11198 (toList!5614 List!18290)) )
))
(declare-fun contains!4659 (ListLongMap!11197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2876 (array!54170 array!54168 (_ BitVec 32) (_ BitVec 32) V!30415 V!30415 (_ BitVec 32) Int) ListLongMap!11197)

(assert (=> b!912179 (= res!615347 (contains!4659 (getCurrentListMap!2876 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!912180 () Bool)

(declare-fun res!615348 () Bool)

(assert (=> b!912180 (=> (not res!615348) (not e!511676))))

(declare-datatypes ((List!18291 0))(
  ( (Nil!18288) (Cons!18287 (h!19433 (_ BitVec 64)) (t!25878 List!18291)) )
))
(declare-fun arrayNoDuplicates!0 (array!54170 (_ BitVec 32) List!18291) Bool)

(assert (=> b!912180 (= res!615348 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18288))))

(declare-fun b!912181 () Bool)

(assert (=> b!912181 (= e!511675 (and e!511677 mapRes!30355))))

(declare-fun condMapEmpty!30355 () Bool)

(declare-fun mapDefault!30355 () ValueCell!9062)

