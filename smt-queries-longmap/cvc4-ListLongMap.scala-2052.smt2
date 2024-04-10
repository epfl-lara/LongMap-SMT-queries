; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35484 () Bool)

(assert start!35484)

(declare-fun b!355628 () Bool)

(declare-fun e!217826 () Bool)

(declare-fun tp_is_empty!7937 () Bool)

(assert (=> b!355628 (= e!217826 tp_is_empty!7937)))

(declare-fun res!197315 () Bool)

(declare-fun e!217825 () Bool)

(assert (=> start!35484 (=> (not res!197315) (not e!217825))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35484 (= res!197315 (validMask!0 mask!1842))))

(assert (=> start!35484 e!217825))

(assert (=> start!35484 true))

(declare-datatypes ((V!11559 0))(
  ( (V!11560 (val!4013 Int)) )
))
(declare-datatypes ((ValueCell!3625 0))(
  ( (ValueCellFull!3625 (v!6207 V!11559)) (EmptyCell!3625) )
))
(declare-datatypes ((array!19453 0))(
  ( (array!19454 (arr!9220 (Array (_ BitVec 32) ValueCell!3625)) (size!9572 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19453)

(declare-fun e!217823 () Bool)

(declare-fun array_inv!6774 (array!19453) Bool)

(assert (=> start!35484 (and (array_inv!6774 _values!1208) e!217823)))

(declare-datatypes ((array!19455 0))(
  ( (array!19456 (arr!9221 (Array (_ BitVec 32) (_ BitVec 64))) (size!9573 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19455)

(declare-fun array_inv!6775 (array!19455) Bool)

(assert (=> start!35484 (array_inv!6775 _keys!1456)))

(declare-fun b!355629 () Bool)

(declare-fun res!197316 () Bool)

(assert (=> b!355629 (=> (not res!197316) (not e!217825))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355629 (= res!197316 (and (= (size!9572 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9573 _keys!1456) (size!9572 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355630 () Bool)

(declare-fun res!197317 () Bool)

(assert (=> b!355630 (=> (not res!197317) (not e!217825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19455 (_ BitVec 32)) Bool)

(assert (=> b!355630 (= res!197317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355631 () Bool)

(declare-fun e!217824 () Bool)

(assert (=> b!355631 (= e!217824 tp_is_empty!7937)))

(declare-fun mapNonEmpty!13413 () Bool)

(declare-fun mapRes!13413 () Bool)

(declare-fun tp!27390 () Bool)

(assert (=> mapNonEmpty!13413 (= mapRes!13413 (and tp!27390 e!217824))))

(declare-fun mapValue!13413 () ValueCell!3625)

(declare-fun mapRest!13413 () (Array (_ BitVec 32) ValueCell!3625))

(declare-fun mapKey!13413 () (_ BitVec 32))

(assert (=> mapNonEmpty!13413 (= (arr!9220 _values!1208) (store mapRest!13413 mapKey!13413 mapValue!13413))))

(declare-fun mapIsEmpty!13413 () Bool)

(assert (=> mapIsEmpty!13413 mapRes!13413))

(declare-fun b!355632 () Bool)

(assert (=> b!355632 (= e!217823 (and e!217826 mapRes!13413))))

(declare-fun condMapEmpty!13413 () Bool)

(declare-fun mapDefault!13413 () ValueCell!3625)

