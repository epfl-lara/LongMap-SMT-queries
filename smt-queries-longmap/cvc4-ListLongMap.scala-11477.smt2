; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133664 () Bool)

(assert start!133664)

(declare-fun res!1068468 () Bool)

(declare-fun e!870941 () Bool)

(assert (=> start!133664 (=> (not res!1068468) (not e!870941))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133664 (= res!1068468 (validMask!0 mask!947))))

(assert (=> start!133664 e!870941))

(assert (=> start!133664 true))

(declare-datatypes ((V!59869 0))(
  ( (V!59870 (val!19457 Int)) )
))
(declare-datatypes ((ValueCell!18343 0))(
  ( (ValueCellFull!18343 (v!22209 V!59869)) (EmptyCell!18343) )
))
(declare-datatypes ((array!104200 0))(
  ( (array!104201 (arr!50292 (Array (_ BitVec 32) ValueCell!18343)) (size!50842 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104200)

(declare-fun e!870943 () Bool)

(declare-fun array_inv!39089 (array!104200) Bool)

(assert (=> start!133664 (and (array_inv!39089 _values!487) e!870943)))

(declare-datatypes ((array!104202 0))(
  ( (array!104203 (arr!50293 (Array (_ BitVec 32) (_ BitVec 64))) (size!50843 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104202)

(declare-fun array_inv!39090 (array!104202) Bool)

(assert (=> start!133664 (array_inv!39090 _keys!637)))

(declare-fun b!1562832 () Bool)

(declare-fun e!870940 () Bool)

(declare-fun tp_is_empty!38747 () Bool)

(assert (=> b!1562832 (= e!870940 tp_is_empty!38747)))

(declare-fun b!1562833 () Bool)

(declare-fun e!870942 () Bool)

(assert (=> b!1562833 (= e!870942 tp_is_empty!38747)))

(declare-fun b!1562834 () Bool)

(declare-fun res!1068466 () Bool)

(assert (=> b!1562834 (=> (not res!1068466) (not e!870941))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562834 (= res!1068466 (and (= (size!50842 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50843 _keys!637) (size!50842 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59496 () Bool)

(declare-fun mapRes!59496 () Bool)

(declare-fun tp!113331 () Bool)

(assert (=> mapNonEmpty!59496 (= mapRes!59496 (and tp!113331 e!870940))))

(declare-fun mapKey!59496 () (_ BitVec 32))

(declare-fun mapRest!59496 () (Array (_ BitVec 32) ValueCell!18343))

(declare-fun mapValue!59496 () ValueCell!18343)

(assert (=> mapNonEmpty!59496 (= (arr!50292 _values!487) (store mapRest!59496 mapKey!59496 mapValue!59496))))

(declare-fun b!1562835 () Bool)

(declare-fun res!1068467 () Bool)

(assert (=> b!1562835 (=> (not res!1068467) (not e!870941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104202 (_ BitVec 32)) Bool)

(assert (=> b!1562835 (= res!1068467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59496 () Bool)

(assert (=> mapIsEmpty!59496 mapRes!59496))

(declare-fun b!1562836 () Bool)

(assert (=> b!1562836 (= e!870943 (and e!870942 mapRes!59496))))

(declare-fun condMapEmpty!59496 () Bool)

(declare-fun mapDefault!59496 () ValueCell!18343)

