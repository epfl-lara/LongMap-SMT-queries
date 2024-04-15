; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82588 () Bool)

(assert start!82588)

(declare-fun b_free!18739 () Bool)

(declare-fun b_next!18739 () Bool)

(assert (=> start!82588 (= b_free!18739 (not b_next!18739))))

(declare-fun tp!65338 () Bool)

(declare-fun b_and!30201 () Bool)

(assert (=> start!82588 (= tp!65338 b_and!30201)))

(declare-fun b!962527 () Bool)

(declare-fun res!644194 () Bool)

(declare-fun e!542782 () Bool)

(assert (=> b!962527 (=> (not res!644194) (not e!542782))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962527 (= res!644194 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34306 () Bool)

(declare-fun mapRes!34306 () Bool)

(declare-fun tp!65337 () Bool)

(declare-fun e!542781 () Bool)

(assert (=> mapNonEmpty!34306 (= mapRes!34306 (and tp!65337 e!542781))))

(declare-datatypes ((V!33705 0))(
  ( (V!33706 (val!10821 Int)) )
))
(declare-datatypes ((ValueCell!10289 0))(
  ( (ValueCellFull!10289 (v!13378 V!33705)) (EmptyCell!10289) )
))
(declare-datatypes ((array!59108 0))(
  ( (array!59109 (arr!28423 (Array (_ BitVec 32) ValueCell!10289)) (size!28904 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59108)

(declare-fun mapValue!34306 () ValueCell!10289)

(declare-fun mapKey!34306 () (_ BitVec 32))

(declare-fun mapRest!34306 () (Array (_ BitVec 32) ValueCell!10289))

(assert (=> mapNonEmpty!34306 (= (arr!28423 _values!1400) (store mapRest!34306 mapKey!34306 mapValue!34306))))

(declare-fun b!962528 () Bool)

(declare-fun res!644199 () Bool)

(assert (=> b!962528 (=> (not res!644199) (not e!542782))))

(declare-datatypes ((array!59110 0))(
  ( (array!59111 (arr!28424 (Array (_ BitVec 32) (_ BitVec 64))) (size!28905 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59110)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962528 (= res!644199 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28905 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28905 _keys!1686))))))

(declare-fun b!962529 () Bool)

(declare-fun res!644198 () Bool)

(assert (=> b!962529 (=> (not res!644198) (not e!542782))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33705)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33705)

(declare-datatypes ((tuple2!13958 0))(
  ( (tuple2!13959 (_1!6990 (_ BitVec 64)) (_2!6990 V!33705)) )
))
(declare-datatypes ((List!19768 0))(
  ( (Nil!19765) (Cons!19764 (h!20926 tuple2!13958) (t!28122 List!19768)) )
))
(declare-datatypes ((ListLongMap!12645 0))(
  ( (ListLongMap!12646 (toList!6338 List!19768)) )
))
(declare-fun contains!5385 (ListLongMap!12645 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3500 (array!59110 array!59108 (_ BitVec 32) (_ BitVec 32) V!33705 V!33705 (_ BitVec 32) Int) ListLongMap!12645)

(assert (=> b!962529 (= res!644198 (contains!5385 (getCurrentListMap!3500 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28424 _keys!1686) i!803)))))

(declare-fun b!962530 () Bool)

(declare-fun e!542780 () Bool)

(declare-fun tp_is_empty!21541 () Bool)

(assert (=> b!962530 (= e!542780 tp_is_empty!21541)))

(declare-fun res!644201 () Bool)

(assert (=> start!82588 (=> (not res!644201) (not e!542782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82588 (= res!644201 (validMask!0 mask!2110))))

(assert (=> start!82588 e!542782))

(assert (=> start!82588 true))

(declare-fun e!542779 () Bool)

(declare-fun array_inv!22083 (array!59108) Bool)

(assert (=> start!82588 (and (array_inv!22083 _values!1400) e!542779)))

(declare-fun array_inv!22084 (array!59110) Bool)

(assert (=> start!82588 (array_inv!22084 _keys!1686)))

(assert (=> start!82588 tp!65338))

(assert (=> start!82588 tp_is_empty!21541))

(declare-fun b!962531 () Bool)

(assert (=> b!962531 (= e!542781 tp_is_empty!21541)))

(declare-fun b!962532 () Bool)

(declare-fun res!644197 () Bool)

(assert (=> b!962532 (=> (not res!644197) (not e!542782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59110 (_ BitVec 32)) Bool)

(assert (=> b!962532 (= res!644197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34306 () Bool)

(assert (=> mapIsEmpty!34306 mapRes!34306))

(declare-fun b!962533 () Bool)

(declare-fun res!644196 () Bool)

(assert (=> b!962533 (=> (not res!644196) (not e!542782))))

(declare-datatypes ((List!19769 0))(
  ( (Nil!19766) (Cons!19765 (h!20927 (_ BitVec 64)) (t!28123 List!19769)) )
))
(declare-fun arrayNoDuplicates!0 (array!59110 (_ BitVec 32) List!19769) Bool)

(assert (=> b!962533 (= res!644196 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19766))))

(declare-fun b!962534 () Bool)

(declare-fun res!644200 () Bool)

(assert (=> b!962534 (=> (not res!644200) (not e!542782))))

(assert (=> b!962534 (= res!644200 (and (= (size!28904 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28905 _keys!1686) (size!28904 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962535 () Bool)

(assert (=> b!962535 (= e!542779 (and e!542780 mapRes!34306))))

(declare-fun condMapEmpty!34306 () Bool)

(declare-fun mapDefault!34306 () ValueCell!10289)

(assert (=> b!962535 (= condMapEmpty!34306 (= (arr!28423 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10289)) mapDefault!34306)))))

(declare-fun b!962536 () Bool)

(declare-fun res!644195 () Bool)

(assert (=> b!962536 (=> (not res!644195) (not e!542782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962536 (= res!644195 (validKeyInArray!0 (select (arr!28424 _keys!1686) i!803)))))

(declare-fun b!962537 () Bool)

(assert (=> b!962537 (= e!542782 (not true))))

(assert (=> b!962537 (contains!5385 (getCurrentListMap!3500 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28424 _keys!1686) i!803))))

(declare-datatypes ((Unit!32070 0))(
  ( (Unit!32071) )
))
(declare-fun lt!430676 () Unit!32070)

(declare-fun lemmaInListMapFromThenInFromMinusOne!1 (array!59110 array!59108 (_ BitVec 32) (_ BitVec 32) V!33705 V!33705 (_ BitVec 32) (_ BitVec 32) Int) Unit!32070)

(assert (=> b!962537 (= lt!430676 (lemmaInListMapFromThenInFromMinusOne!1 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(assert (= (and start!82588 res!644201) b!962534))

(assert (= (and b!962534 res!644200) b!962532))

(assert (= (and b!962532 res!644197) b!962533))

(assert (= (and b!962533 res!644196) b!962528))

(assert (= (and b!962528 res!644199) b!962536))

(assert (= (and b!962536 res!644195) b!962529))

(assert (= (and b!962529 res!644198) b!962527))

(assert (= (and b!962527 res!644194) b!962537))

(assert (= (and b!962535 condMapEmpty!34306) mapIsEmpty!34306))

(assert (= (and b!962535 (not condMapEmpty!34306)) mapNonEmpty!34306))

(get-info :version)

(assert (= (and mapNonEmpty!34306 ((_ is ValueCellFull!10289) mapValue!34306)) b!962531))

(assert (= (and b!962535 ((_ is ValueCellFull!10289) mapDefault!34306)) b!962530))

(assert (= start!82588 b!962535))

(declare-fun m!891571 () Bool)

(assert (=> b!962529 m!891571))

(declare-fun m!891573 () Bool)

(assert (=> b!962529 m!891573))

(assert (=> b!962529 m!891571))

(assert (=> b!962529 m!891573))

(declare-fun m!891575 () Bool)

(assert (=> b!962529 m!891575))

(assert (=> b!962536 m!891573))

(assert (=> b!962536 m!891573))

(declare-fun m!891577 () Bool)

(assert (=> b!962536 m!891577))

(declare-fun m!891579 () Bool)

(assert (=> b!962532 m!891579))

(declare-fun m!891581 () Bool)

(assert (=> b!962533 m!891581))

(declare-fun m!891583 () Bool)

(assert (=> mapNonEmpty!34306 m!891583))

(declare-fun m!891585 () Bool)

(assert (=> b!962537 m!891585))

(assert (=> b!962537 m!891573))

(assert (=> b!962537 m!891585))

(assert (=> b!962537 m!891573))

(declare-fun m!891587 () Bool)

(assert (=> b!962537 m!891587))

(declare-fun m!891589 () Bool)

(assert (=> b!962537 m!891589))

(declare-fun m!891591 () Bool)

(assert (=> start!82588 m!891591))

(declare-fun m!891593 () Bool)

(assert (=> start!82588 m!891593))

(declare-fun m!891595 () Bool)

(assert (=> start!82588 m!891595))

(check-sat (not b!962537) (not b_next!18739) (not b!962532) b_and!30201 (not mapNonEmpty!34306) (not b!962529) (not b!962536) tp_is_empty!21541 (not b!962533) (not start!82588))
(check-sat b_and!30201 (not b_next!18739))
