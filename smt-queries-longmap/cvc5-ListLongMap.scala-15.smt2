; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!482 () Bool)

(assert start!482)

(declare-fun b!2827 () Bool)

(declare-fun e!1160 () Bool)

(declare-fun tp_is_empty!73 () Bool)

(assert (=> b!2827 (= e!1160 tp_is_empty!73)))

(declare-fun mapNonEmpty!56 () Bool)

(declare-fun mapRes!56 () Bool)

(declare-fun tp!296 () Bool)

(declare-fun e!1163 () Bool)

(assert (=> mapNonEmpty!56 (= mapRes!56 (and tp!296 e!1163))))

(declare-datatypes ((V!275 0))(
  ( (V!276 (val!42 Int)) )
))
(declare-datatypes ((ValueCell!20 0))(
  ( (ValueCellFull!20 (v!1128 V!275)) (EmptyCell!20) )
))
(declare-fun mapValue!56 () ValueCell!20)

(declare-fun mapRest!56 () (Array (_ BitVec 32) ValueCell!20))

(declare-datatypes ((array!79 0))(
  ( (array!80 (arr!36 (Array (_ BitVec 32) ValueCell!20)) (size!98 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!79)

(declare-fun mapKey!56 () (_ BitVec 32))

(assert (=> mapNonEmpty!56 (= (arr!36 _values!1492) (store mapRest!56 mapKey!56 mapValue!56))))

(declare-fun b!2828 () Bool)

(declare-fun res!4859 () Bool)

(declare-fun e!1162 () Bool)

(assert (=> b!2828 (=> (not res!4859) (not e!1162))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!81 0))(
  ( (array!82 (arr!37 (Array (_ BitVec 32) (_ BitVec 64))) (size!99 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!81)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2828 (= res!4859 (and (= (size!98 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!99 _keys!1806) (size!98 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!4857 () Bool)

(assert (=> start!482 (=> (not res!4857) (not e!1162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!482 (= res!4857 (validMask!0 mask!2250))))

(assert (=> start!482 e!1162))

(assert (=> start!482 true))

(declare-fun e!1164 () Bool)

(declare-fun array_inv!17 (array!79) Bool)

(assert (=> start!482 (and (array_inv!17 _values!1492) e!1164)))

(declare-fun array_inv!18 (array!81) Bool)

(assert (=> start!482 (array_inv!18 _keys!1806)))

(declare-fun b!2829 () Bool)

(assert (=> b!2829 (= e!1163 tp_is_empty!73)))

(declare-fun b!2830 () Bool)

(declare-fun res!4858 () Bool)

(assert (=> b!2830 (=> (not res!4858) (not e!1162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81 (_ BitVec 32)) Bool)

(assert (=> b!2830 (= res!4858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!2831 () Bool)

(assert (=> b!2831 (= e!1162 (and (bvsle #b00000000000000000000000000000000 (size!99 _keys!1806)) (bvsge (size!99 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!56 () Bool)

(assert (=> mapIsEmpty!56 mapRes!56))

(declare-fun b!2832 () Bool)

(assert (=> b!2832 (= e!1164 (and e!1160 mapRes!56))))

(declare-fun condMapEmpty!56 () Bool)

(declare-fun mapDefault!56 () ValueCell!20)

