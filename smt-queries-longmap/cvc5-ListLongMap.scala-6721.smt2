; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84298 () Bool)

(assert start!84298)

(declare-fun res!659835 () Bool)

(declare-fun e!555969 () Bool)

(assert (=> start!84298 (=> (not res!659835) (not e!555969))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84298 (= res!659835 (validMask!0 mask!1948))))

(assert (=> start!84298 e!555969))

(assert (=> start!84298 true))

(declare-datatypes ((V!35785 0))(
  ( (V!35786 (val!11601 Int)) )
))
(declare-datatypes ((ValueCell!11069 0))(
  ( (ValueCellFull!11069 (v!14163 V!35785)) (EmptyCell!11069) )
))
(declare-datatypes ((array!62169 0))(
  ( (array!62170 (arr!29942 (Array (_ BitVec 32) ValueCell!11069)) (size!30421 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62169)

(declare-fun e!555972 () Bool)

(declare-fun array_inv!23139 (array!62169) Bool)

(assert (=> start!84298 (and (array_inv!23139 _values!1278) e!555972)))

(declare-datatypes ((array!62171 0))(
  ( (array!62172 (arr!29943 (Array (_ BitVec 32) (_ BitVec 64))) (size!30422 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62171)

(declare-fun array_inv!23140 (array!62171) Bool)

(assert (=> start!84298 (array_inv!23140 _keys!1544)))

(declare-fun b!986155 () Bool)

(assert (=> b!986155 (= e!555969 false)))

(declare-fun lt!437447 () Bool)

(declare-datatypes ((List!20730 0))(
  ( (Nil!20727) (Cons!20726 (h!21888 (_ BitVec 64)) (t!29629 List!20730)) )
))
(declare-fun arrayNoDuplicates!0 (array!62171 (_ BitVec 32) List!20730) Bool)

(assert (=> b!986155 (= lt!437447 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20727))))

(declare-fun b!986156 () Bool)

(declare-fun e!555970 () Bool)

(declare-fun tp_is_empty!23101 () Bool)

(assert (=> b!986156 (= e!555970 tp_is_empty!23101)))

(declare-fun b!986157 () Bool)

(declare-fun res!659836 () Bool)

(assert (=> b!986157 (=> (not res!659836) (not e!555969))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986157 (= res!659836 (and (= (size!30421 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30422 _keys!1544) (size!30421 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986158 () Bool)

(declare-fun res!659837 () Bool)

(assert (=> b!986158 (=> (not res!659837) (not e!555969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62171 (_ BitVec 32)) Bool)

(assert (=> b!986158 (= res!659837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36680 () Bool)

(declare-fun mapRes!36680 () Bool)

(assert (=> mapIsEmpty!36680 mapRes!36680))

(declare-fun b!986159 () Bool)

(declare-fun e!555968 () Bool)

(assert (=> b!986159 (= e!555972 (and e!555968 mapRes!36680))))

(declare-fun condMapEmpty!36680 () Bool)

(declare-fun mapDefault!36680 () ValueCell!11069)

