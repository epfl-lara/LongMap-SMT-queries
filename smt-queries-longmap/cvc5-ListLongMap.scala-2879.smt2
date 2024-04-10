; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41394 () Bool)

(assert start!41394)

(declare-fun b!462617 () Bool)

(declare-fun res!276654 () Bool)

(declare-fun e!269996 () Bool)

(assert (=> b!462617 (=> (not res!276654) (not e!269996))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!28821 0))(
  ( (array!28822 (arr!13844 (Array (_ BitVec 32) (_ BitVec 64))) (size!14196 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28821)

(declare-datatypes ((V!17787 0))(
  ( (V!17788 (val!6300 Int)) )
))
(declare-datatypes ((ValueCell!5912 0))(
  ( (ValueCellFull!5912 (v!8587 V!17787)) (EmptyCell!5912) )
))
(declare-datatypes ((array!28823 0))(
  ( (array!28824 (arr!13845 (Array (_ BitVec 32) ValueCell!5912)) (size!14197 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28823)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462617 (= res!276654 (and (= (size!14197 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14196 _keys!1025) (size!14197 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462618 () Bool)

(assert (=> b!462618 (= e!269996 false)))

(declare-fun lt!209240 () Bool)

(declare-datatypes ((List!8349 0))(
  ( (Nil!8346) (Cons!8345 (h!9201 (_ BitVec 64)) (t!14293 List!8349)) )
))
(declare-fun arrayNoDuplicates!0 (array!28821 (_ BitVec 32) List!8349) Bool)

(assert (=> b!462618 (= lt!209240 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8346))))

(declare-fun b!462619 () Bool)

(declare-fun e!269997 () Bool)

(declare-fun e!269993 () Bool)

(declare-fun mapRes!20437 () Bool)

(assert (=> b!462619 (= e!269997 (and e!269993 mapRes!20437))))

(declare-fun condMapEmpty!20437 () Bool)

(declare-fun mapDefault!20437 () ValueCell!5912)

