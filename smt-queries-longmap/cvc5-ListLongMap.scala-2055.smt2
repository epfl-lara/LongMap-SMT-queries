; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35498 () Bool)

(assert start!35498)

(declare-fun b!355754 () Bool)

(declare-fun res!197378 () Bool)

(declare-fun e!217930 () Bool)

(assert (=> b!355754 (=> (not res!197378) (not e!217930))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19479 0))(
  ( (array!19480 (arr!9233 (Array (_ BitVec 32) (_ BitVec 64))) (size!9585 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19479)

(declare-datatypes ((V!11579 0))(
  ( (V!11580 (val!4020 Int)) )
))
(declare-datatypes ((ValueCell!3632 0))(
  ( (ValueCellFull!3632 (v!6214 V!11579)) (EmptyCell!3632) )
))
(declare-datatypes ((array!19481 0))(
  ( (array!19482 (arr!9234 (Array (_ BitVec 32) ValueCell!3632)) (size!9586 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19481)

(assert (=> b!355754 (= res!197378 (and (= (size!9586 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9585 _keys!1456) (size!9586 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13434 () Bool)

(declare-fun mapRes!13434 () Bool)

(declare-fun tp!27411 () Bool)

(declare-fun e!217931 () Bool)

(assert (=> mapNonEmpty!13434 (= mapRes!13434 (and tp!27411 e!217931))))

(declare-fun mapKey!13434 () (_ BitVec 32))

(declare-fun mapValue!13434 () ValueCell!3632)

(declare-fun mapRest!13434 () (Array (_ BitVec 32) ValueCell!3632))

(assert (=> mapNonEmpty!13434 (= (arr!9234 _values!1208) (store mapRest!13434 mapKey!13434 mapValue!13434))))

(declare-fun b!355755 () Bool)

(declare-fun tp_is_empty!7951 () Bool)

(assert (=> b!355755 (= e!217931 tp_is_empty!7951)))

(declare-fun res!197380 () Bool)

(assert (=> start!35498 (=> (not res!197380) (not e!217930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35498 (= res!197380 (validMask!0 mask!1842))))

(assert (=> start!35498 e!217930))

(assert (=> start!35498 true))

(declare-fun e!217927 () Bool)

(declare-fun array_inv!6786 (array!19481) Bool)

(assert (=> start!35498 (and (array_inv!6786 _values!1208) e!217927)))

(declare-fun array_inv!6787 (array!19479) Bool)

(assert (=> start!35498 (array_inv!6787 _keys!1456)))

(declare-fun b!355756 () Bool)

(assert (=> b!355756 (= e!217930 false)))

(declare-fun lt!165842 () Bool)

(declare-datatypes ((List!5347 0))(
  ( (Nil!5344) (Cons!5343 (h!6199 (_ BitVec 64)) (t!10497 List!5347)) )
))
(declare-fun arrayNoDuplicates!0 (array!19479 (_ BitVec 32) List!5347) Bool)

(assert (=> b!355756 (= lt!165842 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5344))))

(declare-fun b!355757 () Bool)

(declare-fun e!217928 () Bool)

(assert (=> b!355757 (= e!217928 tp_is_empty!7951)))

(declare-fun b!355758 () Bool)

(declare-fun res!197379 () Bool)

(assert (=> b!355758 (=> (not res!197379) (not e!217930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19479 (_ BitVec 32)) Bool)

(assert (=> b!355758 (= res!197379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13434 () Bool)

(assert (=> mapIsEmpty!13434 mapRes!13434))

(declare-fun b!355759 () Bool)

(assert (=> b!355759 (= e!217927 (and e!217928 mapRes!13434))))

(declare-fun condMapEmpty!13434 () Bool)

(declare-fun mapDefault!13434 () ValueCell!3632)

