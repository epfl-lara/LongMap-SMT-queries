; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40454 () Bool)

(assert start!40454)

(declare-fun b!445199 () Bool)

(declare-fun res!264127 () Bool)

(declare-fun e!261723 () Bool)

(assert (=> b!445199 (=> (not res!264127) (not e!261723))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445199 (= res!264127 (validKeyInArray!0 k!794))))

(declare-fun b!445201 () Bool)

(declare-fun e!261724 () Bool)

(assert (=> b!445201 (= e!261724 false)))

(declare-fun lt!203609 () Bool)

(declare-datatypes ((array!27485 0))(
  ( (array!27486 (arr!13190 (Array (_ BitVec 32) (_ BitVec 64))) (size!13542 (_ BitVec 32))) )
))
(declare-fun lt!203608 () array!27485)

(declare-datatypes ((List!7886 0))(
  ( (Nil!7883) (Cons!7882 (h!8738 (_ BitVec 64)) (t!13644 List!7886)) )
))
(declare-fun arrayNoDuplicates!0 (array!27485 (_ BitVec 32) List!7886) Bool)

(assert (=> b!445201 (= lt!203609 (arrayNoDuplicates!0 lt!203608 #b00000000000000000000000000000000 Nil!7883))))

(declare-fun b!445202 () Bool)

(declare-fun e!261728 () Bool)

(declare-fun tp_is_empty!11839 () Bool)

(assert (=> b!445202 (= e!261728 tp_is_empty!11839)))

(declare-fun mapNonEmpty!19386 () Bool)

(declare-fun mapRes!19386 () Bool)

(declare-fun tp!37368 () Bool)

(assert (=> mapNonEmpty!19386 (= mapRes!19386 (and tp!37368 e!261728))))

(declare-datatypes ((V!16891 0))(
  ( (V!16892 (val!5964 Int)) )
))
(declare-datatypes ((ValueCell!5576 0))(
  ( (ValueCellFull!5576 (v!8215 V!16891)) (EmptyCell!5576) )
))
(declare-fun mapValue!19386 () ValueCell!5576)

(declare-fun mapKey!19386 () (_ BitVec 32))

(declare-datatypes ((array!27487 0))(
  ( (array!27488 (arr!13191 (Array (_ BitVec 32) ValueCell!5576)) (size!13543 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27487)

(declare-fun mapRest!19386 () (Array (_ BitVec 32) ValueCell!5576))

(assert (=> mapNonEmpty!19386 (= (arr!13191 _values!549) (store mapRest!19386 mapKey!19386 mapValue!19386))))

(declare-fun b!445203 () Bool)

(declare-fun res!264130 () Bool)

(assert (=> b!445203 (=> (not res!264130) (not e!261723))))

(declare-fun _keys!709 () array!27485)

(declare-fun arrayContainsKey!0 (array!27485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445203 (= res!264130 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!445204 () Bool)

(assert (=> b!445204 (= e!261723 e!261724)))

(declare-fun res!264128 () Bool)

(assert (=> b!445204 (=> (not res!264128) (not e!261724))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27485 (_ BitVec 32)) Bool)

(assert (=> b!445204 (= res!264128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203608 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445204 (= lt!203608 (array!27486 (store (arr!13190 _keys!709) i!563 k!794) (size!13542 _keys!709)))))

(declare-fun b!445205 () Bool)

(declare-fun res!264122 () Bool)

(assert (=> b!445205 (=> (not res!264122) (not e!261723))))

(assert (=> b!445205 (= res!264122 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13542 _keys!709))))))

(declare-fun b!445206 () Bool)

(declare-fun res!264126 () Bool)

(assert (=> b!445206 (=> (not res!264126) (not e!261723))))

(assert (=> b!445206 (= res!264126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445207 () Bool)

(declare-fun res!264129 () Bool)

(assert (=> b!445207 (=> (not res!264129) (not e!261723))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!445207 (= res!264129 (and (= (size!13543 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13542 _keys!709) (size!13543 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!264125 () Bool)

(assert (=> start!40454 (=> (not res!264125) (not e!261723))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40454 (= res!264125 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13542 _keys!709))))))

(assert (=> start!40454 e!261723))

(assert (=> start!40454 true))

(declare-fun e!261725 () Bool)

(declare-fun array_inv!9562 (array!27487) Bool)

(assert (=> start!40454 (and (array_inv!9562 _values!549) e!261725)))

(declare-fun array_inv!9563 (array!27485) Bool)

(assert (=> start!40454 (array_inv!9563 _keys!709)))

(declare-fun b!445200 () Bool)

(declare-fun res!264123 () Bool)

(assert (=> b!445200 (=> (not res!264123) (not e!261723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445200 (= res!264123 (validMask!0 mask!1025))))

(declare-fun b!445208 () Bool)

(declare-fun e!261727 () Bool)

(assert (=> b!445208 (= e!261725 (and e!261727 mapRes!19386))))

(declare-fun condMapEmpty!19386 () Bool)

(declare-fun mapDefault!19386 () ValueCell!5576)

