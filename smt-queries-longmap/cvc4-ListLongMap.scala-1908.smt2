; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33990 () Bool)

(assert start!33990)

(declare-fun b_free!7121 () Bool)

(declare-fun b_next!7121 () Bool)

(assert (=> start!33990 (= b_free!7121 (not b_next!7121))))

(declare-fun tp!24882 () Bool)

(declare-fun b_and!14311 () Bool)

(assert (=> start!33990 (= tp!24882 b_and!14311)))

(declare-fun b!338656 () Bool)

(declare-fun e!207786 () Bool)

(declare-fun e!207787 () Bool)

(assert (=> b!338656 (= e!207786 e!207787)))

(declare-fun res!187078 () Bool)

(assert (=> b!338656 (=> (not res!187078) (not e!207787))))

(declare-datatypes ((SeekEntryResult!3243 0))(
  ( (MissingZero!3243 (index!15151 (_ BitVec 32))) (Found!3243 (index!15152 (_ BitVec 32))) (Intermediate!3243 (undefined!4055 Bool) (index!15153 (_ BitVec 32)) (x!33739 (_ BitVec 32))) (Undefined!3243) (MissingVacant!3243 (index!15154 (_ BitVec 32))) )
))
(declare-fun lt!160869 () SeekEntryResult!3243)

(assert (=> b!338656 (= res!187078 (and (not (is-Found!3243 lt!160869)) (is-MissingZero!3243 lt!160869)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17741 0))(
  ( (array!17742 (arr!8396 (Array (_ BitVec 32) (_ BitVec 64))) (size!8748 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17741)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17741 (_ BitVec 32)) SeekEntryResult!3243)

(assert (=> b!338656 (= lt!160869 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!338657 () Bool)

(declare-fun e!207784 () Bool)

(declare-fun tp_is_empty!7073 () Bool)

(assert (=> b!338657 (= e!207784 tp_is_empty!7073)))

(declare-fun b!338658 () Bool)

(declare-fun e!207785 () Bool)

(assert (=> b!338658 (= e!207785 tp_is_empty!7073)))

(declare-fun b!338659 () Bool)

(declare-fun res!187079 () Bool)

(assert (=> b!338659 (=> (not res!187079) (not e!207786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338659 (= res!187079 (validKeyInArray!0 k!1348))))

(declare-fun mapNonEmpty!12021 () Bool)

(declare-fun mapRes!12021 () Bool)

(declare-fun tp!24881 () Bool)

(assert (=> mapNonEmpty!12021 (= mapRes!12021 (and tp!24881 e!207785))))

(declare-datatypes ((V!10407 0))(
  ( (V!10408 (val!3581 Int)) )
))
(declare-datatypes ((ValueCell!3193 0))(
  ( (ValueCellFull!3193 (v!5748 V!10407)) (EmptyCell!3193) )
))
(declare-fun mapValue!12021 () ValueCell!3193)

(declare-fun mapRest!12021 () (Array (_ BitVec 32) ValueCell!3193))

(declare-fun mapKey!12021 () (_ BitVec 32))

(declare-datatypes ((array!17743 0))(
  ( (array!17744 (arr!8397 (Array (_ BitVec 32) ValueCell!3193)) (size!8749 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17743)

(assert (=> mapNonEmpty!12021 (= (arr!8397 _values!1525) (store mapRest!12021 mapKey!12021 mapValue!12021))))

(declare-fun b!338660 () Bool)

(declare-fun e!207789 () Bool)

(assert (=> b!338660 (= e!207789 (and e!207784 mapRes!12021))))

(declare-fun condMapEmpty!12021 () Bool)

(declare-fun mapDefault!12021 () ValueCell!3193)

