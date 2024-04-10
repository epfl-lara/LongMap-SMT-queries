; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41370 () Bool)

(assert start!41370)

(declare-fun b!462401 () Bool)

(declare-fun e!269815 () Bool)

(declare-fun tp_is_empty!12487 () Bool)

(assert (=> b!462401 (= e!269815 tp_is_empty!12487)))

(declare-fun b!462402 () Bool)

(declare-fun res!276548 () Bool)

(declare-fun e!269813 () Bool)

(assert (=> b!462402 (=> (not res!276548) (not e!269813))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28775 0))(
  ( (array!28776 (arr!13821 (Array (_ BitVec 32) (_ BitVec 64))) (size!14173 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28775)

(declare-datatypes ((V!17755 0))(
  ( (V!17756 (val!6288 Int)) )
))
(declare-datatypes ((ValueCell!5900 0))(
  ( (ValueCellFull!5900 (v!8575 V!17755)) (EmptyCell!5900) )
))
(declare-datatypes ((array!28777 0))(
  ( (array!28778 (arr!13822 (Array (_ BitVec 32) ValueCell!5900)) (size!14174 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28777)

(assert (=> b!462402 (= res!276548 (and (= (size!14174 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14173 _keys!1025) (size!14174 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462403 () Bool)

(declare-fun res!276546 () Bool)

(assert (=> b!462403 (=> (not res!276546) (not e!269813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28775 (_ BitVec 32)) Bool)

(assert (=> b!462403 (= res!276546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462404 () Bool)

(declare-fun e!269816 () Bool)

(declare-fun mapRes!20401 () Bool)

(assert (=> b!462404 (= e!269816 (and e!269815 mapRes!20401))))

(declare-fun condMapEmpty!20401 () Bool)

(declare-fun mapDefault!20401 () ValueCell!5900)

