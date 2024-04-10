; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35292 () Bool)

(assert start!35292)

(declare-fun mapIsEmpty!13176 () Bool)

(declare-fun mapRes!13176 () Bool)

(assert (=> mapIsEmpty!13176 mapRes!13176))

(declare-fun b!353623 () Bool)

(declare-fun res!196049 () Bool)

(declare-fun e!216596 () Bool)

(assert (=> b!353623 (=> (not res!196049) (not e!216596))))

(declare-datatypes ((array!19163 0))(
  ( (array!19164 (arr!9079 (Array (_ BitVec 32) (_ BitVec 64))) (size!9431 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19163)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19163 (_ BitVec 32)) Bool)

(assert (=> b!353623 (= res!196049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13176 () Bool)

(declare-fun tp!27072 () Bool)

(declare-fun e!216597 () Bool)

(assert (=> mapNonEmpty!13176 (= mapRes!13176 (and tp!27072 e!216597))))

(declare-datatypes ((V!11359 0))(
  ( (V!11360 (val!3938 Int)) )
))
(declare-datatypes ((ValueCell!3550 0))(
  ( (ValueCellFull!3550 (v!6131 V!11359)) (EmptyCell!3550) )
))
(declare-fun mapValue!13176 () ValueCell!3550)

(declare-fun mapKey!13176 () (_ BitVec 32))

(declare-fun mapRest!13176 () (Array (_ BitVec 32) ValueCell!3550))

(declare-datatypes ((array!19165 0))(
  ( (array!19166 (arr!9080 (Array (_ BitVec 32) ValueCell!3550)) (size!9432 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19165)

(assert (=> mapNonEmpty!13176 (= (arr!9080 _values!1208) (store mapRest!13176 mapKey!13176 mapValue!13176))))

(declare-fun b!353624 () Bool)

(declare-fun res!196047 () Bool)

(assert (=> b!353624 (=> (not res!196047) (not e!216596))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353624 (= res!196047 (and (= (size!9432 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9431 _keys!1456) (size!9432 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353626 () Bool)

(declare-fun tp_is_empty!7787 () Bool)

(assert (=> b!353626 (= e!216597 tp_is_empty!7787)))

(declare-fun b!353627 () Bool)

(assert (=> b!353627 (= e!216596 (and (bvsle #b00000000000000000000000000000000 (size!9431 _keys!1456)) (bvsge (size!9431 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353628 () Bool)

(declare-fun e!216598 () Bool)

(declare-fun e!216600 () Bool)

(assert (=> b!353628 (= e!216598 (and e!216600 mapRes!13176))))

(declare-fun condMapEmpty!13176 () Bool)

(declare-fun mapDefault!13176 () ValueCell!3550)

