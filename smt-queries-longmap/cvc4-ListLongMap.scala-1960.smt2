; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34510 () Bool)

(assert start!34510)

(declare-fun b_free!7433 () Bool)

(declare-fun b_next!7433 () Bool)

(assert (=> start!34510 (= b_free!7433 (not b_next!7433))))

(declare-fun tp!25845 () Bool)

(declare-fun b_and!14641 () Bool)

(assert (=> start!34510 (= tp!25845 b_and!14641)))

(declare-fun b!344893 () Bool)

(declare-fun res!190790 () Bool)

(declare-fun e!211402 () Bool)

(assert (=> b!344893 (=> (not res!190790) (not e!211402))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344893 (= res!190790 (validKeyInArray!0 k!1348))))

(declare-fun b!344894 () Bool)

(assert (=> b!344894 (= e!211402 false)))

(declare-datatypes ((array!18353 0))(
  ( (array!18354 (arr!8693 (Array (_ BitVec 32) (_ BitVec 64))) (size!9045 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18353)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3350 0))(
  ( (MissingZero!3350 (index!15579 (_ BitVec 32))) (Found!3350 (index!15580 (_ BitVec 32))) (Intermediate!3350 (undefined!4162 Bool) (index!15581 (_ BitVec 32)) (x!34352 (_ BitVec 32))) (Undefined!3350) (MissingVacant!3350 (index!15582 (_ BitVec 32))) )
))
(declare-fun lt!162724 () SeekEntryResult!3350)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18353 (_ BitVec 32)) SeekEntryResult!3350)

(assert (=> b!344894 (= lt!162724 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12516 () Bool)

(declare-fun mapRes!12516 () Bool)

(declare-fun tp!25844 () Bool)

(declare-fun e!211400 () Bool)

(assert (=> mapNonEmpty!12516 (= mapRes!12516 (and tp!25844 e!211400))))

(declare-fun mapKey!12516 () (_ BitVec 32))

(declare-datatypes ((V!10823 0))(
  ( (V!10824 (val!3737 Int)) )
))
(declare-datatypes ((ValueCell!3349 0))(
  ( (ValueCellFull!3349 (v!5913 V!10823)) (EmptyCell!3349) )
))
(declare-fun mapValue!12516 () ValueCell!3349)

(declare-datatypes ((array!18355 0))(
  ( (array!18356 (arr!8694 (Array (_ BitVec 32) ValueCell!3349)) (size!9046 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18355)

(declare-fun mapRest!12516 () (Array (_ BitVec 32) ValueCell!3349))

(assert (=> mapNonEmpty!12516 (= (arr!8694 _values!1525) (store mapRest!12516 mapKey!12516 mapValue!12516))))

(declare-fun b!344895 () Bool)

(declare-fun tp_is_empty!7385 () Bool)

(assert (=> b!344895 (= e!211400 tp_is_empty!7385)))

(declare-fun res!190793 () Bool)

(assert (=> start!34510 (=> (not res!190793) (not e!211402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34510 (= res!190793 (validMask!0 mask!2385))))

(assert (=> start!34510 e!211402))

(assert (=> start!34510 true))

(assert (=> start!34510 tp_is_empty!7385))

(assert (=> start!34510 tp!25845))

(declare-fun e!211403 () Bool)

(declare-fun array_inv!6434 (array!18355) Bool)

(assert (=> start!34510 (and (array_inv!6434 _values!1525) e!211403)))

(declare-fun array_inv!6435 (array!18353) Bool)

(assert (=> start!34510 (array_inv!6435 _keys!1895)))

(declare-fun b!344896 () Bool)

(declare-fun res!190788 () Bool)

(assert (=> b!344896 (=> (not res!190788) (not e!211402))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344896 (= res!190788 (and (= (size!9046 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9045 _keys!1895) (size!9046 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344897 () Bool)

(declare-fun e!211401 () Bool)

(assert (=> b!344897 (= e!211401 tp_is_empty!7385)))

(declare-fun b!344898 () Bool)

(assert (=> b!344898 (= e!211403 (and e!211401 mapRes!12516))))

(declare-fun condMapEmpty!12516 () Bool)

(declare-fun mapDefault!12516 () ValueCell!3349)

