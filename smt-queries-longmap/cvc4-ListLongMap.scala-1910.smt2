; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34002 () Bool)

(assert start!34002)

(declare-fun b_free!7133 () Bool)

(declare-fun b_next!7133 () Bool)

(assert (=> start!34002 (= b_free!7133 (not b_next!7133))))

(declare-fun tp!24917 () Bool)

(declare-fun b_and!14323 () Bool)

(assert (=> start!34002 (= tp!24917 b_and!14323)))

(declare-fun b!338888 () Bool)

(declare-datatypes ((Unit!10545 0))(
  ( (Unit!10546) )
))
(declare-fun e!207919 () Unit!10545)

(declare-fun Unit!10547 () Unit!10545)

(assert (=> b!338888 (= e!207919 Unit!10547)))

(declare-fun lt!160931 () Unit!10545)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10423 0))(
  ( (V!10424 (val!3587 Int)) )
))
(declare-fun zeroValue!1467 () V!10423)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3199 0))(
  ( (ValueCellFull!3199 (v!5754 V!10423)) (EmptyCell!3199) )
))
(declare-datatypes ((array!17765 0))(
  ( (array!17766 (arr!8408 (Array (_ BitVec 32) ValueCell!3199)) (size!8760 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17765)

(declare-datatypes ((array!17767 0))(
  ( (array!17768 (arr!8409 (Array (_ BitVec 32) (_ BitVec 64))) (size!8761 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17767)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10423)

(declare-fun lemmaArrayContainsKeyThenInListMap!280 (array!17767 array!17765 (_ BitVec 32) (_ BitVec 32) V!10423 V!10423 (_ BitVec 64) (_ BitVec 32) Int) Unit!10545)

(declare-fun arrayScanForKey!0 (array!17767 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338888 (= lt!160931 (lemmaArrayContainsKeyThenInListMap!280 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338888 false))

(declare-fun b!338889 () Bool)

(declare-fun e!207923 () Bool)

(declare-fun e!207924 () Bool)

(assert (=> b!338889 (= e!207923 e!207924)))

(declare-fun res!187221 () Bool)

(assert (=> b!338889 (=> (not res!187221) (not e!207924))))

(declare-datatypes ((SeekEntryResult!3248 0))(
  ( (MissingZero!3248 (index!15171 (_ BitVec 32))) (Found!3248 (index!15172 (_ BitVec 32))) (Intermediate!3248 (undefined!4060 Bool) (index!15173 (_ BitVec 32)) (x!33760 (_ BitVec 32))) (Undefined!3248) (MissingVacant!3248 (index!15174 (_ BitVec 32))) )
))
(declare-fun lt!160932 () SeekEntryResult!3248)

(assert (=> b!338889 (= res!187221 (and (not (is-Found!3248 lt!160932)) (is-MissingZero!3248 lt!160932)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17767 (_ BitVec 32)) SeekEntryResult!3248)

(assert (=> b!338889 (= lt!160932 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!338890 () Bool)

(declare-fun res!187219 () Bool)

(assert (=> b!338890 (=> (not res!187219) (not e!207923))))

(declare-datatypes ((List!4826 0))(
  ( (Nil!4823) (Cons!4822 (h!5678 (_ BitVec 64)) (t!9924 List!4826)) )
))
(declare-fun arrayNoDuplicates!0 (array!17767 (_ BitVec 32) List!4826) Bool)

(assert (=> b!338890 (= res!187219 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4823))))

(declare-fun b!338891 () Bool)

(declare-fun e!207920 () Bool)

(declare-fun tp_is_empty!7085 () Bool)

(assert (=> b!338891 (= e!207920 tp_is_empty!7085)))

(declare-fun b!338892 () Bool)

(declare-fun res!187223 () Bool)

(assert (=> b!338892 (=> (not res!187223) (not e!207923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338892 (= res!187223 (validKeyInArray!0 k!1348))))

(declare-fun res!187222 () Bool)

(assert (=> start!34002 (=> (not res!187222) (not e!207923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34002 (= res!187222 (validMask!0 mask!2385))))

(assert (=> start!34002 e!207923))

(assert (=> start!34002 true))

(assert (=> start!34002 tp_is_empty!7085))

(assert (=> start!34002 tp!24917))

(declare-fun e!207921 () Bool)

(declare-fun array_inv!6234 (array!17765) Bool)

(assert (=> start!34002 (and (array_inv!6234 _values!1525) e!207921)))

(declare-fun array_inv!6235 (array!17767) Bool)

(assert (=> start!34002 (array_inv!6235 _keys!1895)))

(declare-fun b!338893 () Bool)

(declare-fun e!207917 () Bool)

(declare-fun mapRes!12039 () Bool)

(assert (=> b!338893 (= e!207921 (and e!207917 mapRes!12039))))

(declare-fun condMapEmpty!12039 () Bool)

(declare-fun mapDefault!12039 () ValueCell!3199)

