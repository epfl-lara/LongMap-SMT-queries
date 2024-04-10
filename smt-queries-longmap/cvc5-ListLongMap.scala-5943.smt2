; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77474 () Bool)

(assert start!77474)

(declare-fun res!609219 () Bool)

(declare-fun e!505742 () Bool)

(assert (=> start!77474 (=> (not res!609219) (not e!505742))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77474 (= res!609219 (validMask!0 mask!1756))))

(assert (=> start!77474 e!505742))

(assert (=> start!77474 true))

(declare-datatypes ((V!29615 0))(
  ( (V!29616 (val!9294 Int)) )
))
(declare-datatypes ((ValueCell!8762 0))(
  ( (ValueCellFull!8762 (v!11799 V!29615)) (EmptyCell!8762) )
))
(declare-datatypes ((array!53034 0))(
  ( (array!53035 (arr!25477 (Array (_ BitVec 32) ValueCell!8762)) (size!25936 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53034)

(declare-fun e!505741 () Bool)

(declare-fun array_inv!19972 (array!53034) Bool)

(assert (=> start!77474 (and (array_inv!19972 _values!1152) e!505741)))

(declare-datatypes ((array!53036 0))(
  ( (array!53037 (arr!25478 (Array (_ BitVec 32) (_ BitVec 64))) (size!25937 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53036)

(declare-fun array_inv!19973 (array!53036) Bool)

(assert (=> start!77474 (array_inv!19973 _keys!1386)))

(declare-fun mapNonEmpty!29440 () Bool)

(declare-fun mapRes!29440 () Bool)

(declare-fun tp!56499 () Bool)

(declare-fun e!505739 () Bool)

(assert (=> mapNonEmpty!29440 (= mapRes!29440 (and tp!56499 e!505739))))

(declare-fun mapRest!29440 () (Array (_ BitVec 32) ValueCell!8762))

(declare-fun mapValue!29440 () ValueCell!8762)

(declare-fun mapKey!29440 () (_ BitVec 32))

(assert (=> mapNonEmpty!29440 (= (arr!25477 _values!1152) (store mapRest!29440 mapKey!29440 mapValue!29440))))

(declare-fun b!902848 () Bool)

(declare-fun e!505740 () Bool)

(declare-fun tp_is_empty!18487 () Bool)

(assert (=> b!902848 (= e!505740 tp_is_empty!18487)))

(declare-fun b!902849 () Bool)

(declare-fun res!609221 () Bool)

(assert (=> b!902849 (=> (not res!609221) (not e!505742))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902849 (= res!609221 (and (= (size!25936 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25937 _keys!1386) (size!25936 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902850 () Bool)

(assert (=> b!902850 (= e!505742 false)))

(declare-fun lt!407925 () Bool)

(declare-datatypes ((List!17896 0))(
  ( (Nil!17893) (Cons!17892 (h!19038 (_ BitVec 64)) (t!25279 List!17896)) )
))
(declare-fun arrayNoDuplicates!0 (array!53036 (_ BitVec 32) List!17896) Bool)

(assert (=> b!902850 (= lt!407925 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17893))))

(declare-fun b!902851 () Bool)

(declare-fun res!609220 () Bool)

(assert (=> b!902851 (=> (not res!609220) (not e!505742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53036 (_ BitVec 32)) Bool)

(assert (=> b!902851 (= res!609220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29440 () Bool)

(assert (=> mapIsEmpty!29440 mapRes!29440))

(declare-fun b!902852 () Bool)

(assert (=> b!902852 (= e!505741 (and e!505740 mapRes!29440))))

(declare-fun condMapEmpty!29440 () Bool)

(declare-fun mapDefault!29440 () ValueCell!8762)

