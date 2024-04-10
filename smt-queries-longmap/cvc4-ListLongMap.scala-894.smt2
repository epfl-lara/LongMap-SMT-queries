; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20464 () Bool)

(assert start!20464)

(declare-fun b_free!5123 () Bool)

(declare-fun b_next!5123 () Bool)

(assert (=> start!20464 (= b_free!5123 (not b_next!5123))))

(declare-fun tp!18400 () Bool)

(declare-fun b_and!11869 () Bool)

(assert (=> start!20464 (= tp!18400 b_and!11869)))

(declare-fun b!202851 () Bool)

(declare-fun res!97315 () Bool)

(declare-fun e!132842 () Bool)

(assert (=> b!202851 (=> (not res!97315) (not e!132842))))

(declare-datatypes ((array!9183 0))(
  ( (array!9184 (arr!4342 (Array (_ BitVec 32) (_ BitVec 64))) (size!4667 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9183)

(declare-datatypes ((V!6285 0))(
  ( (V!6286 (val!2534 Int)) )
))
(declare-datatypes ((ValueCell!2146 0))(
  ( (ValueCellFull!2146 (v!4504 V!6285)) (EmptyCell!2146) )
))
(declare-datatypes ((array!9185 0))(
  ( (array!9186 (arr!4343 (Array (_ BitVec 32) ValueCell!2146)) (size!4668 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9185)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202851 (= res!97315 (and (= (size!4668 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4667 _keys!825) (size!4668 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8537 () Bool)

(declare-fun mapRes!8537 () Bool)

(assert (=> mapIsEmpty!8537 mapRes!8537))

(declare-fun res!97318 () Bool)

(assert (=> start!20464 (=> (not res!97318) (not e!132842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20464 (= res!97318 (validMask!0 mask!1149))))

(assert (=> start!20464 e!132842))

(declare-fun e!132843 () Bool)

(declare-fun array_inv!2865 (array!9185) Bool)

(assert (=> start!20464 (and (array_inv!2865 _values!649) e!132843)))

(assert (=> start!20464 true))

(declare-fun tp_is_empty!4979 () Bool)

(assert (=> start!20464 tp_is_empty!4979))

(declare-fun array_inv!2866 (array!9183) Bool)

(assert (=> start!20464 (array_inv!2866 _keys!825)))

(assert (=> start!20464 tp!18400))

(declare-fun b!202852 () Bool)

(declare-fun res!97319 () Bool)

(assert (=> b!202852 (=> (not res!97319) (not e!132842))))

(declare-datatypes ((List!2748 0))(
  ( (Nil!2745) (Cons!2744 (h!3386 (_ BitVec 64)) (t!7679 List!2748)) )
))
(declare-fun arrayNoDuplicates!0 (array!9183 (_ BitVec 32) List!2748) Bool)

(assert (=> b!202852 (= res!97319 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2745))))

(declare-fun b!202853 () Bool)

(declare-fun e!132839 () Bool)

(assert (=> b!202853 (= e!132843 (and e!132839 mapRes!8537))))

(declare-fun condMapEmpty!8537 () Bool)

(declare-fun mapDefault!8537 () ValueCell!2146)

