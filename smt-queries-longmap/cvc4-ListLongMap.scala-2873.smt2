; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41362 () Bool)

(assert start!41362)

(declare-fun b!462329 () Bool)

(declare-fun e!269755 () Bool)

(assert (=> b!462329 (= e!269755 false)))

(declare-fun lt!209192 () Bool)

(declare-datatypes ((array!28759 0))(
  ( (array!28760 (arr!13813 (Array (_ BitVec 32) (_ BitVec 64))) (size!14165 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28759)

(declare-datatypes ((List!8339 0))(
  ( (Nil!8336) (Cons!8335 (h!9191 (_ BitVec 64)) (t!14283 List!8339)) )
))
(declare-fun arrayNoDuplicates!0 (array!28759 (_ BitVec 32) List!8339) Bool)

(assert (=> b!462329 (= lt!209192 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8336))))

(declare-fun b!462330 () Bool)

(declare-fun e!269757 () Bool)

(declare-fun tp_is_empty!12479 () Bool)

(assert (=> b!462330 (= e!269757 tp_is_empty!12479)))

(declare-fun mapNonEmpty!20389 () Bool)

(declare-fun mapRes!20389 () Bool)

(declare-fun tp!39208 () Bool)

(declare-fun e!269753 () Bool)

(assert (=> mapNonEmpty!20389 (= mapRes!20389 (and tp!39208 e!269753))))

(declare-datatypes ((V!17743 0))(
  ( (V!17744 (val!6284 Int)) )
))
(declare-datatypes ((ValueCell!5896 0))(
  ( (ValueCellFull!5896 (v!8571 V!17743)) (EmptyCell!5896) )
))
(declare-fun mapRest!20389 () (Array (_ BitVec 32) ValueCell!5896))

(declare-datatypes ((array!28761 0))(
  ( (array!28762 (arr!13814 (Array (_ BitVec 32) ValueCell!5896)) (size!14166 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28761)

(declare-fun mapKey!20389 () (_ BitVec 32))

(declare-fun mapValue!20389 () ValueCell!5896)

(assert (=> mapNonEmpty!20389 (= (arr!13814 _values!833) (store mapRest!20389 mapKey!20389 mapValue!20389))))

(declare-fun b!462331 () Bool)

(declare-fun res!276511 () Bool)

(assert (=> b!462331 (=> (not res!276511) (not e!269755))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462331 (= res!276511 (and (= (size!14166 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14165 _keys!1025) (size!14166 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!276510 () Bool)

(assert (=> start!41362 (=> (not res!276510) (not e!269755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41362 (= res!276510 (validMask!0 mask!1365))))

(assert (=> start!41362 e!269755))

(assert (=> start!41362 true))

(declare-fun array_inv!9988 (array!28759) Bool)

(assert (=> start!41362 (array_inv!9988 _keys!1025)))

(declare-fun e!269754 () Bool)

(declare-fun array_inv!9989 (array!28761) Bool)

(assert (=> start!41362 (and (array_inv!9989 _values!833) e!269754)))

(declare-fun b!462332 () Bool)

(declare-fun res!276512 () Bool)

(assert (=> b!462332 (=> (not res!276512) (not e!269755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28759 (_ BitVec 32)) Bool)

(assert (=> b!462332 (= res!276512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462333 () Bool)

(assert (=> b!462333 (= e!269754 (and e!269757 mapRes!20389))))

(declare-fun condMapEmpty!20389 () Bool)

(declare-fun mapDefault!20389 () ValueCell!5896)

