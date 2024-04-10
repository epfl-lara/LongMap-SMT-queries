; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41380 () Bool)

(assert start!41380)

(declare-fun b!462491 () Bool)

(declare-fun res!276591 () Bool)

(declare-fun e!269889 () Bool)

(assert (=> b!462491 (=> (not res!276591) (not e!269889))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28793 0))(
  ( (array!28794 (arr!13830 (Array (_ BitVec 32) (_ BitVec 64))) (size!14182 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28793)

(declare-datatypes ((V!17767 0))(
  ( (V!17768 (val!6293 Int)) )
))
(declare-datatypes ((ValueCell!5905 0))(
  ( (ValueCellFull!5905 (v!8580 V!17767)) (EmptyCell!5905) )
))
(declare-datatypes ((array!28795 0))(
  ( (array!28796 (arr!13831 (Array (_ BitVec 32) ValueCell!5905)) (size!14183 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28795)

(assert (=> b!462491 (= res!276591 (and (= (size!14183 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14182 _keys!1025) (size!14183 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462492 () Bool)

(declare-fun res!276593 () Bool)

(assert (=> b!462492 (=> (not res!276593) (not e!269889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28793 (_ BitVec 32)) Bool)

(assert (=> b!462492 (= res!276593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462493 () Bool)

(assert (=> b!462493 (= e!269889 false)))

(declare-fun lt!209219 () Bool)

(declare-datatypes ((List!8344 0))(
  ( (Nil!8341) (Cons!8340 (h!9196 (_ BitVec 64)) (t!14288 List!8344)) )
))
(declare-fun arrayNoDuplicates!0 (array!28793 (_ BitVec 32) List!8344) Bool)

(assert (=> b!462493 (= lt!209219 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8341))))

(declare-fun b!462494 () Bool)

(declare-fun e!269890 () Bool)

(declare-fun e!269891 () Bool)

(declare-fun mapRes!20416 () Bool)

(assert (=> b!462494 (= e!269890 (and e!269891 mapRes!20416))))

(declare-fun condMapEmpty!20416 () Bool)

(declare-fun mapDefault!20416 () ValueCell!5905)

