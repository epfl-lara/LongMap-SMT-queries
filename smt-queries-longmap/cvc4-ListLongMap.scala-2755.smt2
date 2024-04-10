; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40386 () Bool)

(assert start!40386)

(declare-fun b!443873 () Bool)

(declare-fun res!263105 () Bool)

(declare-fun e!261116 () Bool)

(assert (=> b!443873 (=> (not res!263105) (not e!261116))))

(declare-datatypes ((array!27351 0))(
  ( (array!27352 (arr!13123 (Array (_ BitVec 32) (_ BitVec 64))) (size!13475 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27351)

(declare-datatypes ((List!7863 0))(
  ( (Nil!7860) (Cons!7859 (h!8715 (_ BitVec 64)) (t!13621 List!7863)) )
))
(declare-fun arrayNoDuplicates!0 (array!27351 (_ BitVec 32) List!7863) Bool)

(assert (=> b!443873 (= res!263105 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7860))))

(declare-fun res!263102 () Bool)

(assert (=> start!40386 (=> (not res!263102) (not e!261116))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40386 (= res!263102 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13475 _keys!709))))))

(assert (=> start!40386 e!261116))

(assert (=> start!40386 true))

(declare-datatypes ((V!16799 0))(
  ( (V!16800 (val!5930 Int)) )
))
(declare-datatypes ((ValueCell!5542 0))(
  ( (ValueCellFull!5542 (v!8181 V!16799)) (EmptyCell!5542) )
))
(declare-datatypes ((array!27353 0))(
  ( (array!27354 (arr!13124 (Array (_ BitVec 32) ValueCell!5542)) (size!13476 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27353)

(declare-fun e!261112 () Bool)

(declare-fun array_inv!9522 (array!27353) Bool)

(assert (=> start!40386 (and (array_inv!9522 _values!549) e!261112)))

(declare-fun array_inv!9523 (array!27351) Bool)

(assert (=> start!40386 (array_inv!9523 _keys!709)))

(declare-fun mapIsEmpty!19284 () Bool)

(declare-fun mapRes!19284 () Bool)

(assert (=> mapIsEmpty!19284 mapRes!19284))

(declare-fun b!443874 () Bool)

(declare-fun res!263108 () Bool)

(assert (=> b!443874 (=> (not res!263108) (not e!261116))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27351 (_ BitVec 32)) Bool)

(assert (=> b!443874 (= res!263108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443875 () Bool)

(declare-fun res!263110 () Bool)

(assert (=> b!443875 (=> (not res!263110) (not e!261116))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443875 (= res!263110 (and (= (size!13476 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13475 _keys!709) (size!13476 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443876 () Bool)

(declare-fun e!261115 () Bool)

(declare-fun tp_is_empty!11771 () Bool)

(assert (=> b!443876 (= e!261115 tp_is_empty!11771)))

(declare-fun mapNonEmpty!19284 () Bool)

(declare-fun tp!37266 () Bool)

(declare-fun e!261114 () Bool)

(assert (=> mapNonEmpty!19284 (= mapRes!19284 (and tp!37266 e!261114))))

(declare-fun mapKey!19284 () (_ BitVec 32))

(declare-fun mapValue!19284 () ValueCell!5542)

(declare-fun mapRest!19284 () (Array (_ BitVec 32) ValueCell!5542))

(assert (=> mapNonEmpty!19284 (= (arr!13124 _values!549) (store mapRest!19284 mapKey!19284 mapValue!19284))))

(declare-fun b!443877 () Bool)

(declare-fun res!263106 () Bool)

(assert (=> b!443877 (=> (not res!263106) (not e!261116))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443877 (= res!263106 (or (= (select (arr!13123 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13123 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443878 () Bool)

(declare-fun e!261111 () Bool)

(assert (=> b!443878 (= e!261116 e!261111)))

(declare-fun res!263109 () Bool)

(assert (=> b!443878 (=> (not res!263109) (not e!261111))))

(declare-fun lt!203404 () array!27351)

(assert (=> b!443878 (= res!263109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203404 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!443878 (= lt!203404 (array!27352 (store (arr!13123 _keys!709) i!563 k!794) (size!13475 _keys!709)))))

(declare-fun b!443879 () Bool)

(assert (=> b!443879 (= e!261111 false)))

(declare-fun lt!203405 () Bool)

(assert (=> b!443879 (= lt!203405 (arrayNoDuplicates!0 lt!203404 #b00000000000000000000000000000000 Nil!7860))))

(declare-fun b!443880 () Bool)

(declare-fun res!263101 () Bool)

(assert (=> b!443880 (=> (not res!263101) (not e!261116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443880 (= res!263101 (validMask!0 mask!1025))))

(declare-fun b!443881 () Bool)

(declare-fun res!263103 () Bool)

(assert (=> b!443881 (=> (not res!263103) (not e!261116))))

(declare-fun arrayContainsKey!0 (array!27351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443881 (= res!263103 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!443882 () Bool)

(declare-fun res!263107 () Bool)

(assert (=> b!443882 (=> (not res!263107) (not e!261116))))

(assert (=> b!443882 (= res!263107 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13475 _keys!709))))))

(declare-fun b!443883 () Bool)

(assert (=> b!443883 (= e!261114 tp_is_empty!11771)))

(declare-fun b!443884 () Bool)

(assert (=> b!443884 (= e!261112 (and e!261115 mapRes!19284))))

(declare-fun condMapEmpty!19284 () Bool)

(declare-fun mapDefault!19284 () ValueCell!5542)

