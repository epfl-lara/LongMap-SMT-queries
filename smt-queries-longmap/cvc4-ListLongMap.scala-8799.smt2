; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107022 () Bool)

(assert start!107022)

(declare-fun res!844481 () Bool)

(declare-fun e!723164 () Bool)

(assert (=> start!107022 (=> (not res!844481) (not e!723164))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107022 (= res!844481 (validMask!0 mask!1730))))

(assert (=> start!107022 e!723164))

(declare-datatypes ((V!48807 0))(
  ( (V!48808 (val!16430 Int)) )
))
(declare-datatypes ((ValueCell!15502 0))(
  ( (ValueCellFull!15502 (v!19067 V!48807)) (EmptyCell!15502) )
))
(declare-datatypes ((array!82692 0))(
  ( (array!82693 (arr!39883 (Array (_ BitVec 32) ValueCell!15502)) (size!40419 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82692)

(declare-fun e!723167 () Bool)

(declare-fun array_inv!30347 (array!82692) Bool)

(assert (=> start!107022 (and (array_inv!30347 _values!1134) e!723167)))

(assert (=> start!107022 true))

(declare-datatypes ((array!82694 0))(
  ( (array!82695 (arr!39884 (Array (_ BitVec 32) (_ BitVec 64))) (size!40420 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82694)

(declare-fun array_inv!30348 (array!82694) Bool)

(assert (=> start!107022 (array_inv!30348 _keys!1364)))

(declare-fun b!1268897 () Bool)

(assert (=> b!1268897 (= e!723164 false)))

(declare-fun lt!574503 () Bool)

(declare-datatypes ((List!28400 0))(
  ( (Nil!28397) (Cons!28396 (h!29605 (_ BitVec 64)) (t!41929 List!28400)) )
))
(declare-fun arrayNoDuplicates!0 (array!82694 (_ BitVec 32) List!28400) Bool)

(assert (=> b!1268897 (= lt!574503 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28397))))

(declare-fun mapIsEmpty!50647 () Bool)

(declare-fun mapRes!50647 () Bool)

(assert (=> mapIsEmpty!50647 mapRes!50647))

(declare-fun b!1268898 () Bool)

(declare-fun e!723168 () Bool)

(declare-fun tp_is_empty!32711 () Bool)

(assert (=> b!1268898 (= e!723168 tp_is_empty!32711)))

(declare-fun b!1268899 () Bool)

(declare-fun e!723165 () Bool)

(assert (=> b!1268899 (= e!723167 (and e!723165 mapRes!50647))))

(declare-fun condMapEmpty!50647 () Bool)

(declare-fun mapDefault!50647 () ValueCell!15502)

