; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43220 () Bool)

(assert start!43220)

(declare-fun b!478966 () Bool)

(declare-fun res!285732 () Bool)

(declare-fun e!281716 () Bool)

(assert (=> b!478966 (=> (not res!285732) (not e!281716))))

(declare-datatypes ((array!30893 0))(
  ( (array!30894 (arr!14854 (Array (_ BitVec 32) (_ BitVec 64))) (size!15212 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30893)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30893 (_ BitVec 32)) Bool)

(assert (=> b!478966 (= res!285732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478967 () Bool)

(declare-fun e!281718 () Bool)

(declare-fun tp_is_empty!13609 () Bool)

(assert (=> b!478967 (= e!281718 tp_is_empty!13609)))

(declare-fun b!478968 () Bool)

(declare-fun res!285731 () Bool)

(assert (=> b!478968 (=> (not res!285731) (not e!281716))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19217 0))(
  ( (V!19218 (val!6852 Int)) )
))
(declare-datatypes ((ValueCell!6443 0))(
  ( (ValueCellFull!6443 (v!9141 V!19217)) (EmptyCell!6443) )
))
(declare-datatypes ((array!30895 0))(
  ( (array!30896 (arr!14855 (Array (_ BitVec 32) ValueCell!6443)) (size!15213 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30895)

(assert (=> b!478968 (= res!285731 (and (= (size!15213 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15212 _keys!1874) (size!15213 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22108 () Bool)

(declare-fun mapRes!22108 () Bool)

(declare-fun tp!42583 () Bool)

(assert (=> mapNonEmpty!22108 (= mapRes!22108 (and tp!42583 e!281718))))

(declare-fun mapRest!22108 () (Array (_ BitVec 32) ValueCell!6443))

(declare-fun mapValue!22108 () ValueCell!6443)

(declare-fun mapKey!22108 () (_ BitVec 32))

(assert (=> mapNonEmpty!22108 (= (arr!14855 _values!1516) (store mapRest!22108 mapKey!22108 mapValue!22108))))

(declare-fun mapIsEmpty!22108 () Bool)

(assert (=> mapIsEmpty!22108 mapRes!22108))

(declare-fun res!285730 () Bool)

(assert (=> start!43220 (=> (not res!285730) (not e!281716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43220 (= res!285730 (validMask!0 mask!2352))))

(assert (=> start!43220 e!281716))

(assert (=> start!43220 true))

(declare-fun e!281717 () Bool)

(declare-fun array_inv!10718 (array!30895) Bool)

(assert (=> start!43220 (and (array_inv!10718 _values!1516) e!281717)))

(declare-fun array_inv!10719 (array!30893) Bool)

(assert (=> start!43220 (array_inv!10719 _keys!1874)))

(declare-fun b!478969 () Bool)

(assert (=> b!478969 (= e!281716 false)))

(declare-fun lt!217798 () Bool)

(declare-datatypes ((List!9077 0))(
  ( (Nil!9074) (Cons!9073 (h!9929 (_ BitVec 64)) (t!15283 List!9077)) )
))
(declare-fun arrayNoDuplicates!0 (array!30893 (_ BitVec 32) List!9077) Bool)

(assert (=> b!478969 (= lt!217798 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9074))))

(declare-fun b!478970 () Bool)

(declare-fun e!281714 () Bool)

(assert (=> b!478970 (= e!281714 tp_is_empty!13609)))

(declare-fun b!478971 () Bool)

(assert (=> b!478971 (= e!281717 (and e!281714 mapRes!22108))))

(declare-fun condMapEmpty!22108 () Bool)

(declare-fun mapDefault!22108 () ValueCell!6443)

