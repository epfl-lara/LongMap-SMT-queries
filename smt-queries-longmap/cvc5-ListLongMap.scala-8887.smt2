; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107918 () Bool)

(assert start!107918)

(declare-fun mapIsEmpty!51365 () Bool)

(declare-fun mapRes!51365 () Bool)

(assert (=> mapIsEmpty!51365 mapRes!51365))

(declare-fun b!1275240 () Bool)

(declare-fun e!727923 () Bool)

(declare-fun tp_is_empty!33235 () Bool)

(assert (=> b!1275240 (= e!727923 tp_is_empty!33235)))

(declare-fun res!847672 () Bool)

(declare-fun e!727922 () Bool)

(assert (=> start!107918 (=> (not res!847672) (not e!727922))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107918 (= res!847672 (validMask!0 mask!1805))))

(assert (=> start!107918 e!727922))

(assert (=> start!107918 true))

(declare-datatypes ((V!49417 0))(
  ( (V!49418 (val!16692 Int)) )
))
(declare-datatypes ((ValueCell!15719 0))(
  ( (ValueCellFull!15719 (v!19288 V!49417)) (EmptyCell!15719) )
))
(declare-datatypes ((array!83578 0))(
  ( (array!83579 (arr!40306 (Array (_ BitVec 32) ValueCell!15719)) (size!40856 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83578)

(declare-fun e!727921 () Bool)

(declare-fun array_inv!30639 (array!83578) Bool)

(assert (=> start!107918 (and (array_inv!30639 _values!1187) e!727921)))

(declare-datatypes ((array!83580 0))(
  ( (array!83581 (arr!40307 (Array (_ BitVec 32) (_ BitVec 64))) (size!40857 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83580)

(declare-fun array_inv!30640 (array!83580) Bool)

(assert (=> start!107918 (array_inv!30640 _keys!1427)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun b!1275241 () Bool)

(assert (=> b!1275241 (= e!727922 (and (= (size!40856 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40857 _keys!1427) (size!40856 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011) (not (= (size!40857 _keys!1427) (bvadd #b00000000000000000000000000000001 mask!1805)))))))

(declare-fun b!1275242 () Bool)

(declare-fun e!727920 () Bool)

(assert (=> b!1275242 (= e!727921 (and e!727920 mapRes!51365))))

(declare-fun condMapEmpty!51365 () Bool)

(declare-fun mapDefault!51365 () ValueCell!15719)

