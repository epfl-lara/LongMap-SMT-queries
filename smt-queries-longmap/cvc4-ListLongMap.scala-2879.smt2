; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41398 () Bool)

(assert start!41398)

(declare-fun mapIsEmpty!20443 () Bool)

(declare-fun mapRes!20443 () Bool)

(assert (=> mapIsEmpty!20443 mapRes!20443))

(declare-fun res!276672 () Bool)

(declare-fun e!270027 () Bool)

(assert (=> start!41398 (=> (not res!276672) (not e!270027))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41398 (= res!276672 (validMask!0 mask!1365))))

(assert (=> start!41398 e!270027))

(assert (=> start!41398 true))

(declare-datatypes ((array!28829 0))(
  ( (array!28830 (arr!13848 (Array (_ BitVec 32) (_ BitVec 64))) (size!14200 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28829)

(declare-fun array_inv!10012 (array!28829) Bool)

(assert (=> start!41398 (array_inv!10012 _keys!1025)))

(declare-datatypes ((V!17791 0))(
  ( (V!17792 (val!6302 Int)) )
))
(declare-datatypes ((ValueCell!5914 0))(
  ( (ValueCellFull!5914 (v!8589 V!17791)) (EmptyCell!5914) )
))
(declare-datatypes ((array!28831 0))(
  ( (array!28832 (arr!13849 (Array (_ BitVec 32) ValueCell!5914)) (size!14201 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28831)

(declare-fun e!270025 () Bool)

(declare-fun array_inv!10013 (array!28831) Bool)

(assert (=> start!41398 (and (array_inv!10013 _values!833) e!270025)))

(declare-fun b!462653 () Bool)

(declare-fun e!270023 () Bool)

(declare-fun tp_is_empty!12515 () Bool)

(assert (=> b!462653 (= e!270023 tp_is_empty!12515)))

(declare-fun b!462654 () Bool)

(declare-fun res!276673 () Bool)

(assert (=> b!462654 (=> (not res!276673) (not e!270027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28829 (_ BitVec 32)) Bool)

(assert (=> b!462654 (= res!276673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462655 () Bool)

(declare-fun e!270024 () Bool)

(assert (=> b!462655 (= e!270025 (and e!270024 mapRes!20443))))

(declare-fun condMapEmpty!20443 () Bool)

(declare-fun mapDefault!20443 () ValueCell!5914)

