; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78034 () Bool)

(assert start!78034)

(declare-fun b_free!16561 () Bool)

(declare-fun b_next!16561 () Bool)

(assert (=> start!78034 (= b_free!16561 (not b_next!16561))))

(declare-fun tp!57954 () Bool)

(declare-fun b_and!27133 () Bool)

(assert (=> start!78034 (= tp!57954 b_and!27133)))

(declare-fun b!910905 () Bool)

(declare-fun res!614631 () Bool)

(declare-fun e!510794 () Bool)

(assert (=> b!910905 (=> (not res!614631) (not e!510794))))

(declare-datatypes ((V!30271 0))(
  ( (V!30272 (val!9540 Int)) )
))
(declare-datatypes ((ValueCell!9008 0))(
  ( (ValueCellFull!9008 (v!12049 V!30271)) (EmptyCell!9008) )
))
(declare-datatypes ((array!53966 0))(
  ( (array!53967 (arr!25939 (Array (_ BitVec 32) ValueCell!9008)) (size!26398 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53966)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53968 0))(
  ( (array!53969 (arr!25940 (Array (_ BitVec 32) (_ BitVec 64))) (size!26399 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53968)

(assert (=> b!910905 (= res!614631 (and (= (size!26398 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26399 _keys!1386) (size!26398 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!614629 () Bool)

(assert (=> start!78034 (=> (not res!614629) (not e!510794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78034 (= res!614629 (validMask!0 mask!1756))))

(assert (=> start!78034 e!510794))

(declare-fun e!510791 () Bool)

(declare-fun array_inv!20278 (array!53966) Bool)

(assert (=> start!78034 (and (array_inv!20278 _values!1152) e!510791)))

(assert (=> start!78034 tp!57954))

(assert (=> start!78034 true))

(declare-fun tp_is_empty!18979 () Bool)

(assert (=> start!78034 tp_is_empty!18979))

(declare-fun array_inv!20279 (array!53968) Bool)

(assert (=> start!78034 (array_inv!20279 _keys!1386)))

(declare-fun b!910906 () Bool)

(declare-fun res!614628 () Bool)

(assert (=> b!910906 (=> (not res!614628) (not e!510794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53968 (_ BitVec 32)) Bool)

(assert (=> b!910906 (= res!614628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910907 () Bool)

(declare-fun e!510792 () Bool)

(assert (=> b!910907 (= e!510792 tp_is_empty!18979)))

(declare-fun b!910908 () Bool)

(assert (=> b!910908 (= e!510794 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30271)

(declare-fun lt!410324 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30271)

(declare-datatypes ((tuple2!12430 0))(
  ( (tuple2!12431 (_1!6226 (_ BitVec 64)) (_2!6226 V!30271)) )
))
(declare-datatypes ((List!18221 0))(
  ( (Nil!18218) (Cons!18217 (h!19363 tuple2!12430) (t!25806 List!18221)) )
))
(declare-datatypes ((ListLongMap!11127 0))(
  ( (ListLongMap!11128 (toList!5579 List!18221)) )
))
(declare-fun contains!4623 (ListLongMap!11127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2841 (array!53968 array!53966 (_ BitVec 32) (_ BitVec 32) V!30271 V!30271 (_ BitVec 32) Int) ListLongMap!11127)

(assert (=> b!910908 (= lt!410324 (contains!4623 (getCurrentListMap!2841 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapIsEmpty!30190 () Bool)

(declare-fun mapRes!30190 () Bool)

(assert (=> mapIsEmpty!30190 mapRes!30190))

(declare-fun b!910909 () Bool)

(declare-fun res!614630 () Bool)

(assert (=> b!910909 (=> (not res!614630) (not e!510794))))

(declare-datatypes ((List!18222 0))(
  ( (Nil!18219) (Cons!18218 (h!19364 (_ BitVec 64)) (t!25807 List!18222)) )
))
(declare-fun arrayNoDuplicates!0 (array!53968 (_ BitVec 32) List!18222) Bool)

(assert (=> b!910909 (= res!614630 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18219))))

(declare-fun b!910910 () Bool)

(declare-fun e!510795 () Bool)

(assert (=> b!910910 (= e!510795 tp_is_empty!18979)))

(declare-fun b!910911 () Bool)

(assert (=> b!910911 (= e!510791 (and e!510792 mapRes!30190))))

(declare-fun condMapEmpty!30190 () Bool)

(declare-fun mapDefault!30190 () ValueCell!9008)

