; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40400 () Bool)

(assert start!40400)

(declare-fun b!444146 () Bool)

(declare-fun res!263314 () Bool)

(declare-fun e!261239 () Bool)

(assert (=> b!444146 (=> (not res!263314) (not e!261239))))

(declare-datatypes ((array!27379 0))(
  ( (array!27380 (arr!13137 (Array (_ BitVec 32) (_ BitVec 64))) (size!13489 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27379)

(declare-datatypes ((List!7868 0))(
  ( (Nil!7865) (Cons!7864 (h!8720 (_ BitVec 64)) (t!13626 List!7868)) )
))
(declare-fun arrayNoDuplicates!0 (array!27379 (_ BitVec 32) List!7868) Bool)

(assert (=> b!444146 (= res!263314 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7865))))

(declare-fun b!444147 () Bool)

(declare-fun res!263315 () Bool)

(assert (=> b!444147 (=> (not res!263315) (not e!261239))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444147 (= res!263315 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19305 () Bool)

(declare-fun mapRes!19305 () Bool)

(declare-fun tp!37287 () Bool)

(declare-fun e!261242 () Bool)

(assert (=> mapNonEmpty!19305 (= mapRes!19305 (and tp!37287 e!261242))))

(declare-datatypes ((V!16819 0))(
  ( (V!16820 (val!5937 Int)) )
))
(declare-datatypes ((ValueCell!5549 0))(
  ( (ValueCellFull!5549 (v!8188 V!16819)) (EmptyCell!5549) )
))
(declare-datatypes ((array!27381 0))(
  ( (array!27382 (arr!13138 (Array (_ BitVec 32) ValueCell!5549)) (size!13490 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27381)

(declare-fun mapRest!19305 () (Array (_ BitVec 32) ValueCell!5549))

(declare-fun mapValue!19305 () ValueCell!5549)

(declare-fun mapKey!19305 () (_ BitVec 32))

(assert (=> mapNonEmpty!19305 (= (arr!13138 _values!549) (store mapRest!19305 mapKey!19305 mapValue!19305))))

(declare-fun b!444148 () Bool)

(declare-fun res!263313 () Bool)

(assert (=> b!444148 (=> (not res!263313) (not e!261239))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444148 (= res!263313 (validMask!0 mask!1025))))

(declare-fun b!444149 () Bool)

(declare-fun e!261241 () Bool)

(assert (=> b!444149 (= e!261241 false)))

(declare-fun lt!203446 () Bool)

(declare-fun lt!203447 () array!27379)

(assert (=> b!444149 (= lt!203446 (arrayNoDuplicates!0 lt!203447 #b00000000000000000000000000000000 Nil!7865))))

(declare-fun b!444150 () Bool)

(declare-fun tp_is_empty!11785 () Bool)

(assert (=> b!444150 (= e!261242 tp_is_empty!11785)))

(declare-fun b!444151 () Bool)

(declare-fun res!263320 () Bool)

(assert (=> b!444151 (=> (not res!263320) (not e!261239))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444151 (= res!263320 (or (= (select (arr!13137 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13137 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444152 () Bool)

(assert (=> b!444152 (= e!261239 e!261241)))

(declare-fun res!263317 () Bool)

(assert (=> b!444152 (=> (not res!263317) (not e!261241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27379 (_ BitVec 32)) Bool)

(assert (=> b!444152 (= res!263317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203447 mask!1025))))

(assert (=> b!444152 (= lt!203447 (array!27380 (store (arr!13137 _keys!709) i!563 k!794) (size!13489 _keys!709)))))

(declare-fun b!444153 () Bool)

(declare-fun res!263316 () Bool)

(assert (=> b!444153 (=> (not res!263316) (not e!261239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444153 (= res!263316 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!19305 () Bool)

(assert (=> mapIsEmpty!19305 mapRes!19305))

(declare-fun b!444155 () Bool)

(declare-fun e!261240 () Bool)

(assert (=> b!444155 (= e!261240 tp_is_empty!11785)))

(declare-fun b!444156 () Bool)

(declare-fun res!263311 () Bool)

(assert (=> b!444156 (=> (not res!263311) (not e!261239))))

(assert (=> b!444156 (= res!263311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444157 () Bool)

(declare-fun res!263318 () Bool)

(assert (=> b!444157 (=> (not res!263318) (not e!261239))))

(assert (=> b!444157 (= res!263318 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13489 _keys!709))))))

(declare-fun b!444158 () Bool)

(declare-fun e!261237 () Bool)

(assert (=> b!444158 (= e!261237 (and e!261240 mapRes!19305))))

(declare-fun condMapEmpty!19305 () Bool)

(declare-fun mapDefault!19305 () ValueCell!5549)

