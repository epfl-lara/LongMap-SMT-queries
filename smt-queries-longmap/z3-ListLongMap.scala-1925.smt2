; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34182 () Bool)

(assert start!34182)

(declare-fun b_free!7219 () Bool)

(declare-fun b_next!7219 () Bool)

(assert (=> start!34182 (= b_free!7219 (not b_next!7219))))

(declare-fun tp!25191 () Bool)

(declare-fun b_and!14433 () Bool)

(assert (=> start!34182 (= tp!25191 b_and!14433)))

(declare-fun mapIsEmpty!12183 () Bool)

(declare-fun mapRes!12183 () Bool)

(assert (=> mapIsEmpty!12183 mapRes!12183))

(declare-fun b!340904 () Bool)

(declare-fun e!209099 () Bool)

(assert (=> b!340904 (= e!209099 false)))

(declare-fun lt!161700 () (_ BitVec 32))

(declare-datatypes ((array!17928 0))(
  ( (array!17929 (arr!8484 (Array (_ BitVec 32) (_ BitVec 64))) (size!8836 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17928)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17928 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340904 (= lt!161700 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340905 () Bool)

(declare-fun res!188400 () Bool)

(declare-fun e!209097 () Bool)

(assert (=> b!340905 (=> (not res!188400) (not e!209097))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17928 (_ BitVec 32)) Bool)

(assert (=> b!340905 (= res!188400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340906 () Bool)

(declare-fun e!209101 () Bool)

(declare-fun e!209098 () Bool)

(assert (=> b!340906 (= e!209101 (and e!209098 mapRes!12183))))

(declare-fun condMapEmpty!12183 () Bool)

(declare-datatypes ((V!10539 0))(
  ( (V!10540 (val!3630 Int)) )
))
(declare-datatypes ((ValueCell!3242 0))(
  ( (ValueCellFull!3242 (v!5803 V!10539)) (EmptyCell!3242) )
))
(declare-datatypes ((array!17930 0))(
  ( (array!17931 (arr!8485 (Array (_ BitVec 32) ValueCell!3242)) (size!8837 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17930)

(declare-fun mapDefault!12183 () ValueCell!3242)

(assert (=> b!340906 (= condMapEmpty!12183 (= (arr!8485 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3242)) mapDefault!12183)))))

(declare-fun b!340907 () Bool)

(declare-fun tp_is_empty!7171 () Bool)

(assert (=> b!340907 (= e!209098 tp_is_empty!7171)))

(declare-fun b!340908 () Bool)

(declare-fun res!188405 () Bool)

(assert (=> b!340908 (=> (not res!188405) (not e!209099))))

(declare-fun arrayContainsKey!0 (array!17928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340908 (= res!188405 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340909 () Bool)

(assert (=> b!340909 (= e!209097 e!209099)))

(declare-fun res!188401 () Bool)

(assert (=> b!340909 (=> (not res!188401) (not e!209099))))

(declare-datatypes ((SeekEntryResult!3231 0))(
  ( (MissingZero!3231 (index!15103 (_ BitVec 32))) (Found!3231 (index!15104 (_ BitVec 32))) (Intermediate!3231 (undefined!4043 Bool) (index!15105 (_ BitVec 32)) (x!33910 (_ BitVec 32))) (Undefined!3231) (MissingVacant!3231 (index!15106 (_ BitVec 32))) )
))
(declare-fun lt!161701 () SeekEntryResult!3231)

(get-info :version)

(assert (=> b!340909 (= res!188401 (and (not ((_ is Found!3231) lt!161701)) (not ((_ is MissingZero!3231) lt!161701)) ((_ is MissingVacant!3231) lt!161701)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17928 (_ BitVec 32)) SeekEntryResult!3231)

(assert (=> b!340909 (= lt!161701 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340910 () Bool)

(declare-fun e!209100 () Bool)

(assert (=> b!340910 (= e!209100 tp_is_empty!7171)))

(declare-fun b!340911 () Bool)

(declare-fun res!188398 () Bool)

(assert (=> b!340911 (=> (not res!188398) (not e!209097))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340911 (= res!188398 (and (= (size!8837 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8836 _keys!1895) (size!8837 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12183 () Bool)

(declare-fun tp!25190 () Bool)

(assert (=> mapNonEmpty!12183 (= mapRes!12183 (and tp!25190 e!209100))))

(declare-fun mapValue!12183 () ValueCell!3242)

(declare-fun mapKey!12183 () (_ BitVec 32))

(declare-fun mapRest!12183 () (Array (_ BitVec 32) ValueCell!3242))

(assert (=> mapNonEmpty!12183 (= (arr!8485 _values!1525) (store mapRest!12183 mapKey!12183 mapValue!12183))))

(declare-fun b!340912 () Bool)

(declare-fun res!188403 () Bool)

(assert (=> b!340912 (=> (not res!188403) (not e!209097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340912 (= res!188403 (validKeyInArray!0 k0!1348))))

(declare-fun b!340914 () Bool)

(declare-fun res!188404 () Bool)

(assert (=> b!340914 (=> (not res!188404) (not e!209097))))

(declare-datatypes ((List!4783 0))(
  ( (Nil!4780) (Cons!4779 (h!5635 (_ BitVec 64)) (t!9883 List!4783)) )
))
(declare-fun arrayNoDuplicates!0 (array!17928 (_ BitVec 32) List!4783) Bool)

(assert (=> b!340914 (= res!188404 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4780))))

(declare-fun res!188399 () Bool)

(assert (=> start!34182 (=> (not res!188399) (not e!209097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34182 (= res!188399 (validMask!0 mask!2385))))

(assert (=> start!34182 e!209097))

(assert (=> start!34182 true))

(assert (=> start!34182 tp_is_empty!7171))

(assert (=> start!34182 tp!25191))

(declare-fun array_inv!6284 (array!17930) Bool)

(assert (=> start!34182 (and (array_inv!6284 _values!1525) e!209101)))

(declare-fun array_inv!6285 (array!17928) Bool)

(assert (=> start!34182 (array_inv!6285 _keys!1895)))

(declare-fun b!340913 () Bool)

(declare-fun res!188402 () Bool)

(assert (=> b!340913 (=> (not res!188402) (not e!209097))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10539)

(declare-fun zeroValue!1467 () V!10539)

(declare-datatypes ((tuple2!5178 0))(
  ( (tuple2!5179 (_1!2600 (_ BitVec 64)) (_2!2600 V!10539)) )
))
(declare-datatypes ((List!4784 0))(
  ( (Nil!4781) (Cons!4780 (h!5636 tuple2!5178) (t!9884 List!4784)) )
))
(declare-datatypes ((ListLongMap!4093 0))(
  ( (ListLongMap!4094 (toList!2062 List!4784)) )
))
(declare-fun contains!2135 (ListLongMap!4093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1591 (array!17928 array!17930 (_ BitVec 32) (_ BitVec 32) V!10539 V!10539 (_ BitVec 32) Int) ListLongMap!4093)

(assert (=> b!340913 (= res!188402 (not (contains!2135 (getCurrentListMap!1591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34182 res!188399) b!340911))

(assert (= (and b!340911 res!188398) b!340905))

(assert (= (and b!340905 res!188400) b!340914))

(assert (= (and b!340914 res!188404) b!340912))

(assert (= (and b!340912 res!188403) b!340913))

(assert (= (and b!340913 res!188402) b!340909))

(assert (= (and b!340909 res!188401) b!340908))

(assert (= (and b!340908 res!188405) b!340904))

(assert (= (and b!340906 condMapEmpty!12183) mapIsEmpty!12183))

(assert (= (and b!340906 (not condMapEmpty!12183)) mapNonEmpty!12183))

(assert (= (and mapNonEmpty!12183 ((_ is ValueCellFull!3242) mapValue!12183)) b!340910))

(assert (= (and b!340906 ((_ is ValueCellFull!3242) mapDefault!12183)) b!340907))

(assert (= start!34182 b!340906))

(declare-fun m!343743 () Bool)

(assert (=> b!340913 m!343743))

(assert (=> b!340913 m!343743))

(declare-fun m!343745 () Bool)

(assert (=> b!340913 m!343745))

(declare-fun m!343747 () Bool)

(assert (=> b!340912 m!343747))

(declare-fun m!343749 () Bool)

(assert (=> start!34182 m!343749))

(declare-fun m!343751 () Bool)

(assert (=> start!34182 m!343751))

(declare-fun m!343753 () Bool)

(assert (=> start!34182 m!343753))

(declare-fun m!343755 () Bool)

(assert (=> b!340904 m!343755))

(declare-fun m!343757 () Bool)

(assert (=> mapNonEmpty!12183 m!343757))

(declare-fun m!343759 () Bool)

(assert (=> b!340908 m!343759))

(declare-fun m!343761 () Bool)

(assert (=> b!340914 m!343761))

(declare-fun m!343763 () Bool)

(assert (=> b!340905 m!343763))

(declare-fun m!343765 () Bool)

(assert (=> b!340909 m!343765))

(check-sat (not b!340908) tp_is_empty!7171 (not mapNonEmpty!12183) (not b!340905) (not b!340909) (not b!340912) (not b!340904) b_and!14433 (not b_next!7219) (not start!34182) (not b!340913) (not b!340914))
(check-sat b_and!14433 (not b_next!7219))
