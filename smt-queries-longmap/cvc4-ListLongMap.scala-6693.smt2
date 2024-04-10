; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84134 () Bool)

(assert start!84134)

(declare-fun b!983699 () Bool)

(declare-fun e!554577 () Bool)

(declare-fun tp_is_empty!22937 () Bool)

(assert (=> b!983699 (= e!554577 tp_is_empty!22937)))

(declare-fun b!983700 () Bool)

(declare-fun res!658225 () Bool)

(declare-fun e!554576 () Bool)

(assert (=> b!983700 (=> (not res!658225) (not e!554576))))

(declare-datatypes ((array!61857 0))(
  ( (array!61858 (arr!29786 (Array (_ BitVec 32) (_ BitVec 64))) (size!30265 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61857)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61857 (_ BitVec 32)) Bool)

(assert (=> b!983700 (= res!658225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983701 () Bool)

(assert (=> b!983701 (= e!554576 false)))

(declare-fun lt!436562 () Bool)

(declare-datatypes ((List!20622 0))(
  ( (Nil!20619) (Cons!20618 (h!21780 (_ BitVec 64)) (t!29413 List!20622)) )
))
(declare-fun arrayNoDuplicates!0 (array!61857 (_ BitVec 32) List!20622) Bool)

(assert (=> b!983701 (= lt!436562 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20619))))

(declare-fun res!658226 () Bool)

(assert (=> start!84134 (=> (not res!658226) (not e!554576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84134 (= res!658226 (validMask!0 mask!1948))))

(assert (=> start!84134 e!554576))

(assert (=> start!84134 true))

(declare-datatypes ((V!35565 0))(
  ( (V!35566 (val!11519 Int)) )
))
(declare-datatypes ((ValueCell!10987 0))(
  ( (ValueCellFull!10987 (v!14081 V!35565)) (EmptyCell!10987) )
))
(declare-datatypes ((array!61859 0))(
  ( (array!61860 (arr!29787 (Array (_ BitVec 32) ValueCell!10987)) (size!30266 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61859)

(declare-fun e!554579 () Bool)

(declare-fun array_inv!23031 (array!61859) Bool)

(assert (=> start!84134 (and (array_inv!23031 _values!1278) e!554579)))

(declare-fun array_inv!23032 (array!61857) Bool)

(assert (=> start!84134 (array_inv!23032 _keys!1544)))

(declare-fun b!983698 () Bool)

(declare-fun res!658224 () Bool)

(assert (=> b!983698 (=> (not res!658224) (not e!554576))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983698 (= res!658224 (and (= (size!30266 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30265 _keys!1544) (size!30266 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36434 () Bool)

(declare-fun mapRes!36434 () Bool)

(assert (=> mapIsEmpty!36434 mapRes!36434))

(declare-fun b!983702 () Bool)

(declare-fun e!554578 () Bool)

(assert (=> b!983702 (= e!554578 tp_is_empty!22937)))

(declare-fun mapNonEmpty!36434 () Bool)

(declare-fun tp!69118 () Bool)

(assert (=> mapNonEmpty!36434 (= mapRes!36434 (and tp!69118 e!554577))))

(declare-fun mapValue!36434 () ValueCell!10987)

(declare-fun mapKey!36434 () (_ BitVec 32))

(declare-fun mapRest!36434 () (Array (_ BitVec 32) ValueCell!10987))

(assert (=> mapNonEmpty!36434 (= (arr!29787 _values!1278) (store mapRest!36434 mapKey!36434 mapValue!36434))))

(declare-fun b!983703 () Bool)

(assert (=> b!983703 (= e!554579 (and e!554578 mapRes!36434))))

(declare-fun condMapEmpty!36434 () Bool)

(declare-fun mapDefault!36434 () ValueCell!10987)

