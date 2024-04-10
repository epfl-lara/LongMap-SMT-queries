; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107004 () Bool)

(assert start!107004)

(declare-fun b!1268735 () Bool)

(declare-fun e!723030 () Bool)

(declare-fun tp_is_empty!32693 () Bool)

(assert (=> b!1268735 (= e!723030 tp_is_empty!32693)))

(declare-fun b!1268736 () Bool)

(declare-fun e!723033 () Bool)

(assert (=> b!1268736 (= e!723033 tp_is_empty!32693)))

(declare-fun b!1268737 () Bool)

(declare-fun e!723029 () Bool)

(assert (=> b!1268737 (= e!723029 false)))

(declare-fun lt!574476 () Bool)

(declare-datatypes ((array!82656 0))(
  ( (array!82657 (arr!39865 (Array (_ BitVec 32) (_ BitVec 64))) (size!40401 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82656)

(declare-datatypes ((List!28393 0))(
  ( (Nil!28390) (Cons!28389 (h!29598 (_ BitVec 64)) (t!41922 List!28393)) )
))
(declare-fun arrayNoDuplicates!0 (array!82656 (_ BitVec 32) List!28393) Bool)

(assert (=> b!1268737 (= lt!574476 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28390))))

(declare-fun res!844400 () Bool)

(assert (=> start!107004 (=> (not res!844400) (not e!723029))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107004 (= res!844400 (validMask!0 mask!1730))))

(assert (=> start!107004 e!723029))

(declare-datatypes ((V!48783 0))(
  ( (V!48784 (val!16421 Int)) )
))
(declare-datatypes ((ValueCell!15493 0))(
  ( (ValueCellFull!15493 (v!19058 V!48783)) (EmptyCell!15493) )
))
(declare-datatypes ((array!82658 0))(
  ( (array!82659 (arr!39866 (Array (_ BitVec 32) ValueCell!15493)) (size!40402 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82658)

(declare-fun e!723032 () Bool)

(declare-fun array_inv!30333 (array!82658) Bool)

(assert (=> start!107004 (and (array_inv!30333 _values!1134) e!723032)))

(assert (=> start!107004 true))

(declare-fun array_inv!30334 (array!82656) Bool)

(assert (=> start!107004 (array_inv!30334 _keys!1364)))

(declare-fun b!1268738 () Bool)

(declare-fun mapRes!50620 () Bool)

(assert (=> b!1268738 (= e!723032 (and e!723030 mapRes!50620))))

(declare-fun condMapEmpty!50620 () Bool)

(declare-fun mapDefault!50620 () ValueCell!15493)

