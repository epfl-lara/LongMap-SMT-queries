; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3760 () Bool)

(assert start!3760)

(declare-fun b!26234 () Bool)

(declare-fun res!15592 () Bool)

(declare-fun e!17053 () Bool)

(assert (=> b!26234 (=> (not res!15592) (not e!17053))))

(declare-datatypes ((V!1267 0))(
  ( (V!1268 (val!567 Int)) )
))
(declare-datatypes ((ValueCell!341 0))(
  ( (ValueCellFull!341 (v!1653 V!1267)) (EmptyCell!341) )
))
(declare-datatypes ((array!1409 0))(
  ( (array!1410 (arr!662 (Array (_ BitVec 32) ValueCell!341)) (size!763 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1409)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((array!1411 0))(
  ( (array!1412 (arr!663 (Array (_ BitVec 32) (_ BitVec 64))) (size!764 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1411)

(assert (=> b!26234 (= res!15592 (and (= (size!763 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!764 _keys!1833) (size!763 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26235 () Bool)

(declare-fun res!15594 () Bool)

(assert (=> b!26235 (=> (not res!15594) (not e!17053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1411 (_ BitVec 32)) Bool)

(assert (=> b!26235 (= res!15594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26236 () Bool)

(assert (=> b!26236 (= e!17053 false)))

(declare-fun lt!10331 () Bool)

(declare-datatypes ((List!583 0))(
  ( (Nil!580) (Cons!579 (h!1146 (_ BitVec 64)) (t!3270 List!583)) )
))
(declare-fun arrayNoDuplicates!0 (array!1411 (_ BitVec 32) List!583) Bool)

(assert (=> b!26236 (= lt!10331 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!580))))

(declare-fun b!26237 () Bool)

(declare-fun e!17054 () Bool)

(declare-fun tp_is_empty!1081 () Bool)

(assert (=> b!26237 (= e!17054 tp_is_empty!1081)))

(declare-fun b!26238 () Bool)

(declare-fun e!17051 () Bool)

(declare-fun e!17052 () Bool)

(declare-fun mapRes!1138 () Bool)

(assert (=> b!26238 (= e!17051 (and e!17052 mapRes!1138))))

(declare-fun condMapEmpty!1138 () Bool)

(declare-fun mapDefault!1138 () ValueCell!341)

