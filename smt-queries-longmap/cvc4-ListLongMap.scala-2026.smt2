; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35278 () Bool)

(assert start!35278)

(declare-fun b!353549 () Bool)

(declare-fun res!196014 () Bool)

(declare-fun e!216538 () Bool)

(assert (=> b!353549 (=> (not res!196014) (not e!216538))))

(declare-datatypes ((array!19151 0))(
  ( (array!19152 (arr!9074 (Array (_ BitVec 32) (_ BitVec 64))) (size!9426 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19151)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19151 (_ BitVec 32)) Bool)

(assert (=> b!353549 (= res!196014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353550 () Bool)

(assert (=> b!353550 (= e!216538 (bvsgt #b00000000000000000000000000000000 (size!9426 _keys!1456)))))

(declare-fun b!353551 () Bool)

(declare-fun e!216536 () Bool)

(declare-fun tp_is_empty!7781 () Bool)

(assert (=> b!353551 (= e!216536 tp_is_empty!7781)))

(declare-fun res!196015 () Bool)

(assert (=> start!35278 (=> (not res!196015) (not e!216538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35278 (= res!196015 (validMask!0 mask!1842))))

(assert (=> start!35278 e!216538))

(assert (=> start!35278 true))

(declare-datatypes ((V!11351 0))(
  ( (V!11352 (val!3935 Int)) )
))
(declare-datatypes ((ValueCell!3547 0))(
  ( (ValueCellFull!3547 (v!6128 V!11351)) (EmptyCell!3547) )
))
(declare-datatypes ((array!19153 0))(
  ( (array!19154 (arr!9075 (Array (_ BitVec 32) ValueCell!3547)) (size!9427 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19153)

(declare-fun e!216539 () Bool)

(declare-fun array_inv!6686 (array!19153) Bool)

(assert (=> start!35278 (and (array_inv!6686 _values!1208) e!216539)))

(declare-fun array_inv!6687 (array!19151) Bool)

(assert (=> start!35278 (array_inv!6687 _keys!1456)))

(declare-fun mapNonEmpty!13164 () Bool)

(declare-fun mapRes!13164 () Bool)

(declare-fun tp!27060 () Bool)

(assert (=> mapNonEmpty!13164 (= mapRes!13164 (and tp!27060 e!216536))))

(declare-fun mapKey!13164 () (_ BitVec 32))

(declare-fun mapValue!13164 () ValueCell!3547)

(declare-fun mapRest!13164 () (Array (_ BitVec 32) ValueCell!3547))

(assert (=> mapNonEmpty!13164 (= (arr!9075 _values!1208) (store mapRest!13164 mapKey!13164 mapValue!13164))))

(declare-fun b!353552 () Bool)

(declare-fun e!216540 () Bool)

(assert (=> b!353552 (= e!216540 tp_is_empty!7781)))

(declare-fun b!353553 () Bool)

(declare-fun res!196016 () Bool)

(assert (=> b!353553 (=> (not res!196016) (not e!216538))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353553 (= res!196016 (and (= (size!9427 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9426 _keys!1456) (size!9427 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353554 () Bool)

(assert (=> b!353554 (= e!216539 (and e!216540 mapRes!13164))))

(declare-fun condMapEmpty!13164 () Bool)

(declare-fun mapDefault!13164 () ValueCell!3547)

