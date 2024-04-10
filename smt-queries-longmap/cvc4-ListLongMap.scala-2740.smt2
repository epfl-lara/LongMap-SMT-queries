; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40262 () Bool)

(assert start!40262)

(declare-fun b!442028 () Bool)

(declare-fun e!260188 () Bool)

(assert (=> b!442028 (= e!260188 false)))

(declare-fun lt!203062 () Bool)

(declare-datatypes ((array!27173 0))(
  ( (array!27174 (arr!13036 (Array (_ BitVec 32) (_ BitVec 64))) (size!13388 (_ BitVec 32))) )
))
(declare-fun lt!203063 () array!27173)

(declare-datatypes ((List!7828 0))(
  ( (Nil!7825) (Cons!7824 (h!8680 (_ BitVec 64)) (t!13584 List!7828)) )
))
(declare-fun arrayNoDuplicates!0 (array!27173 (_ BitVec 32) List!7828) Bool)

(assert (=> b!442028 (= lt!203062 (arrayNoDuplicates!0 lt!203063 #b00000000000000000000000000000000 Nil!7825))))

(declare-fun b!442029 () Bool)

(declare-fun res!261785 () Bool)

(declare-fun e!260190 () Bool)

(assert (=> b!442029 (=> (not res!261785) (not e!260190))))

(declare-fun _keys!709 () array!27173)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16679 0))(
  ( (V!16680 (val!5885 Int)) )
))
(declare-datatypes ((ValueCell!5497 0))(
  ( (ValueCellFull!5497 (v!8132 V!16679)) (EmptyCell!5497) )
))
(declare-datatypes ((array!27175 0))(
  ( (array!27176 (arr!13037 (Array (_ BitVec 32) ValueCell!5497)) (size!13389 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27175)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!442029 (= res!261785 (and (= (size!13389 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13388 _keys!709) (size!13389 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442030 () Bool)

(declare-fun res!261791 () Bool)

(assert (=> b!442030 (=> (not res!261791) (not e!260190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442030 (= res!261791 (validMask!0 mask!1025))))

(declare-fun b!442031 () Bool)

(declare-fun res!261786 () Bool)

(assert (=> b!442031 (=> (not res!261786) (not e!260190))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442031 (= res!261786 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!442032 () Bool)

(declare-fun e!260192 () Bool)

(declare-fun e!260193 () Bool)

(declare-fun mapRes!19143 () Bool)

(assert (=> b!442032 (= e!260192 (and e!260193 mapRes!19143))))

(declare-fun condMapEmpty!19143 () Bool)

(declare-fun mapDefault!19143 () ValueCell!5497)

