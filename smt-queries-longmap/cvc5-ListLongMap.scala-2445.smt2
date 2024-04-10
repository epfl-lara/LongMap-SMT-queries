; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38488 () Bool)

(assert start!38488)

(declare-fun b!397412 () Bool)

(declare-fun e!240344 () Bool)

(assert (=> b!397412 (= e!240344 false)))

(declare-fun lt!187300 () Bool)

(declare-datatypes ((array!23727 0))(
  ( (array!23728 (arr!11313 (Array (_ BitVec 32) (_ BitVec 64))) (size!11665 (_ BitVec 32))) )
))
(declare-fun lt!187301 () array!23727)

(declare-datatypes ((List!6548 0))(
  ( (Nil!6545) (Cons!6544 (h!7400 (_ BitVec 64)) (t!11722 List!6548)) )
))
(declare-fun arrayNoDuplicates!0 (array!23727 (_ BitVec 32) List!6548) Bool)

(assert (=> b!397412 (= lt!187300 (arrayNoDuplicates!0 lt!187301 #b00000000000000000000000000000000 Nil!6545))))

(declare-fun res!228188 () Bool)

(declare-fun e!240347 () Bool)

(assert (=> start!38488 (=> (not res!228188) (not e!240347))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!23727)

(assert (=> start!38488 (= res!228188 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11665 _keys!709))))))

(assert (=> start!38488 e!240347))

(assert (=> start!38488 true))

(declare-datatypes ((V!14315 0))(
  ( (V!14316 (val!4998 Int)) )
))
(declare-datatypes ((ValueCell!4610 0))(
  ( (ValueCellFull!4610 (v!7245 V!14315)) (EmptyCell!4610) )
))
(declare-datatypes ((array!23729 0))(
  ( (array!23730 (arr!11314 (Array (_ BitVec 32) ValueCell!4610)) (size!11666 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23729)

(declare-fun e!240345 () Bool)

(declare-fun array_inv!8292 (array!23729) Bool)

(assert (=> start!38488 (and (array_inv!8292 _values!549) e!240345)))

(declare-fun array_inv!8293 (array!23727) Bool)

(assert (=> start!38488 (array_inv!8293 _keys!709)))

(declare-fun b!397413 () Bool)

(declare-fun res!228187 () Bool)

(assert (=> b!397413 (=> (not res!228187) (not e!240347))))

(assert (=> b!397413 (= res!228187 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6545))))

(declare-fun mapIsEmpty!16482 () Bool)

(declare-fun mapRes!16482 () Bool)

(assert (=> mapIsEmpty!16482 mapRes!16482))

(declare-fun b!397414 () Bool)

(declare-fun res!228189 () Bool)

(assert (=> b!397414 (=> (not res!228189) (not e!240347))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23727 (_ BitVec 32)) Bool)

(assert (=> b!397414 (= res!228189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397415 () Bool)

(declare-fun res!228183 () Bool)

(assert (=> b!397415 (=> (not res!228183) (not e!240347))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397415 (= res!228183 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16482 () Bool)

(declare-fun tp!32277 () Bool)

(declare-fun e!240346 () Bool)

(assert (=> mapNonEmpty!16482 (= mapRes!16482 (and tp!32277 e!240346))))

(declare-fun mapKey!16482 () (_ BitVec 32))

(declare-fun mapValue!16482 () ValueCell!4610)

(declare-fun mapRest!16482 () (Array (_ BitVec 32) ValueCell!4610))

(assert (=> mapNonEmpty!16482 (= (arr!11314 _values!549) (store mapRest!16482 mapKey!16482 mapValue!16482))))

(declare-fun b!397416 () Bool)

(declare-fun e!240343 () Bool)

(declare-fun tp_is_empty!9907 () Bool)

(assert (=> b!397416 (= e!240343 tp_is_empty!9907)))

(declare-fun b!397417 () Bool)

(declare-fun res!228186 () Bool)

(assert (=> b!397417 (=> (not res!228186) (not e!240347))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397417 (= res!228186 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11665 _keys!709))))))

(declare-fun b!397418 () Bool)

(declare-fun res!228181 () Bool)

(assert (=> b!397418 (=> (not res!228181) (not e!240347))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397418 (= res!228181 (and (= (size!11666 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11665 _keys!709) (size!11666 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397419 () Bool)

(assert (=> b!397419 (= e!240345 (and e!240343 mapRes!16482))))

(declare-fun condMapEmpty!16482 () Bool)

(declare-fun mapDefault!16482 () ValueCell!4610)

