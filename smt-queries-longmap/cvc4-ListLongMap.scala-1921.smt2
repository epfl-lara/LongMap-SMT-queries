; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34176 () Bool)

(assert start!34176)

(declare-fun b_free!7199 () Bool)

(declare-fun b_next!7199 () Bool)

(assert (=> start!34176 (= b_free!7199 (not b_next!7199))))

(declare-fun tp!25130 () Bool)

(declare-fun b_and!14399 () Bool)

(assert (=> start!34176 (= tp!25130 b_and!14399)))

(declare-fun res!188162 () Bool)

(declare-fun e!208953 () Bool)

(assert (=> start!34176 (=> (not res!188162) (not e!208953))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34176 (= res!188162 (validMask!0 mask!2385))))

(assert (=> start!34176 e!208953))

(assert (=> start!34176 true))

(declare-fun tp_is_empty!7151 () Bool)

(assert (=> start!34176 tp_is_empty!7151))

(assert (=> start!34176 tp!25130))

(declare-datatypes ((V!10511 0))(
  ( (V!10512 (val!3620 Int)) )
))
(declare-datatypes ((ValueCell!3232 0))(
  ( (ValueCellFull!3232 (v!5792 V!10511)) (EmptyCell!3232) )
))
(declare-datatypes ((array!17905 0))(
  ( (array!17906 (arr!8473 (Array (_ BitVec 32) ValueCell!3232)) (size!8825 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17905)

(declare-fun e!208954 () Bool)

(declare-fun array_inv!6276 (array!17905) Bool)

(assert (=> start!34176 (and (array_inv!6276 _values!1525) e!208954)))

(declare-datatypes ((array!17907 0))(
  ( (array!17908 (arr!8474 (Array (_ BitVec 32) (_ BitVec 64))) (size!8826 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17907)

(declare-fun array_inv!6277 (array!17907) Bool)

(assert (=> start!34176 (array_inv!6277 _keys!1895)))

(declare-fun b!340627 () Bool)

(declare-fun res!188163 () Bool)

(assert (=> b!340627 (=> (not res!188163) (not e!208953))))

(declare-datatypes ((List!4874 0))(
  ( (Nil!4871) (Cons!4870 (h!5726 (_ BitVec 64)) (t!9982 List!4874)) )
))
(declare-fun arrayNoDuplicates!0 (array!17907 (_ BitVec 32) List!4874) Bool)

(assert (=> b!340627 (= res!188163 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4871))))

(declare-fun b!340628 () Bool)

(declare-fun e!208952 () Bool)

(assert (=> b!340628 (= e!208952 tp_is_empty!7151)))

(declare-fun b!340629 () Bool)

(declare-fun e!208955 () Bool)

(assert (=> b!340629 (= e!208953 e!208955)))

(declare-fun res!188166 () Bool)

(assert (=> b!340629 (=> (not res!188166) (not e!208955))))

(declare-datatypes ((SeekEntryResult!3275 0))(
  ( (MissingZero!3275 (index!15279 (_ BitVec 32))) (Found!3275 (index!15280 (_ BitVec 32))) (Intermediate!3275 (undefined!4087 Bool) (index!15281 (_ BitVec 32)) (x!33925 (_ BitVec 32))) (Undefined!3275) (MissingVacant!3275 (index!15282 (_ BitVec 32))) )
))
(declare-fun lt!161622 () SeekEntryResult!3275)

(assert (=> b!340629 (= res!188166 (and (not (is-Found!3275 lt!161622)) (not (is-MissingZero!3275 lt!161622)) (is-MissingVacant!3275 lt!161622)))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17907 (_ BitVec 32)) SeekEntryResult!3275)

(assert (=> b!340629 (= lt!161622 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!340630 () Bool)

(declare-fun res!188165 () Bool)

(assert (=> b!340630 (=> (not res!188165) (not e!208953))))

(declare-fun zeroValue!1467 () V!10511)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10511)

(declare-datatypes ((tuple2!5256 0))(
  ( (tuple2!5257 (_1!2639 (_ BitVec 64)) (_2!2639 V!10511)) )
))
(declare-datatypes ((List!4875 0))(
  ( (Nil!4872) (Cons!4871 (h!5727 tuple2!5256) (t!9983 List!4875)) )
))
(declare-datatypes ((ListLongMap!4169 0))(
  ( (ListLongMap!4170 (toList!2100 List!4875)) )
))
(declare-fun contains!2154 (ListLongMap!4169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1621 (array!17907 array!17905 (_ BitVec 32) (_ BitVec 32) V!10511 V!10511 (_ BitVec 32) Int) ListLongMap!4169)

(assert (=> b!340630 (= res!188165 (not (contains!2154 (getCurrentListMap!1621 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapIsEmpty!12153 () Bool)

(declare-fun mapRes!12153 () Bool)

(assert (=> mapIsEmpty!12153 mapRes!12153))

(declare-fun b!340631 () Bool)

(declare-fun res!188161 () Bool)

(assert (=> b!340631 (=> (not res!188161) (not e!208953))))

(assert (=> b!340631 (= res!188161 (and (= (size!8825 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8826 _keys!1895) (size!8825 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340632 () Bool)

(declare-fun e!208951 () Bool)

(assert (=> b!340632 (= e!208954 (and e!208951 mapRes!12153))))

(declare-fun condMapEmpty!12153 () Bool)

(declare-fun mapDefault!12153 () ValueCell!3232)

