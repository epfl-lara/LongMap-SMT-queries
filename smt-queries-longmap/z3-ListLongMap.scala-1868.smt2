; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33644 () Bool)

(assert start!33644)

(declare-fun b_free!6879 () Bool)

(declare-fun b_next!6879 () Bool)

(assert (=> start!33644 (= b_free!6879 (not b_next!6879))))

(declare-fun tp!24141 () Bool)

(declare-fun b_and!14059 () Bool)

(assert (=> start!33644 (= tp!24141 b_and!14059)))

(declare-fun b!334008 () Bool)

(declare-fun res!184063 () Bool)

(declare-fun e!205064 () Bool)

(assert (=> b!334008 (=> (not res!184063) (not e!205064))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10085 0))(
  ( (V!10086 (val!3460 Int)) )
))
(declare-fun zeroValue!1467 () V!10085)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!17255 0))(
  ( (array!17256 (arr!8158 (Array (_ BitVec 32) (_ BitVec 64))) (size!8510 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17255)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10085)

(declare-datatypes ((ValueCell!3072 0))(
  ( (ValueCellFull!3072 (v!5622 V!10085)) (EmptyCell!3072) )
))
(declare-datatypes ((array!17257 0))(
  ( (array!17258 (arr!8159 (Array (_ BitVec 32) ValueCell!3072)) (size!8511 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17257)

(declare-datatypes ((tuple2!5028 0))(
  ( (tuple2!5029 (_1!2525 (_ BitVec 64)) (_2!2525 V!10085)) )
))
(declare-datatypes ((List!4647 0))(
  ( (Nil!4644) (Cons!4643 (h!5499 tuple2!5028) (t!9735 List!4647)) )
))
(declare-datatypes ((ListLongMap!3941 0))(
  ( (ListLongMap!3942 (toList!1986 List!4647)) )
))
(declare-fun contains!2030 (ListLongMap!3941 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1514 (array!17255 array!17257 (_ BitVec 32) (_ BitVec 32) V!10085 V!10085 (_ BitVec 32) Int) ListLongMap!3941)

(assert (=> b!334008 (= res!184063 (not (contains!2030 (getCurrentListMap!1514 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334009 () Bool)

(declare-fun e!205065 () Bool)

(assert (=> b!334009 (= e!205064 e!205065)))

(declare-fun res!184061 () Bool)

(assert (=> b!334009 (=> (not res!184061) (not e!205065))))

(declare-datatypes ((SeekEntryResult!3151 0))(
  ( (MissingZero!3151 (index!14783 (_ BitVec 32))) (Found!3151 (index!14784 (_ BitVec 32))) (Intermediate!3151 (undefined!3963 Bool) (index!14785 (_ BitVec 32)) (x!33277 (_ BitVec 32))) (Undefined!3151) (MissingVacant!3151 (index!14786 (_ BitVec 32))) )
))
(declare-fun lt!159445 () SeekEntryResult!3151)

(get-info :version)

(assert (=> b!334009 (= res!184061 (and ((_ is Found!3151) lt!159445) (= (select (arr!8158 _keys!1895) (index!14784 lt!159445)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17255 (_ BitVec 32)) SeekEntryResult!3151)

(assert (=> b!334009 (= lt!159445 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334010 () Bool)

(declare-fun e!205060 () Bool)

(declare-fun e!205063 () Bool)

(declare-fun mapRes!11643 () Bool)

(assert (=> b!334010 (= e!205060 (and e!205063 mapRes!11643))))

(declare-fun condMapEmpty!11643 () Bool)

(declare-fun mapDefault!11643 () ValueCell!3072)

(assert (=> b!334010 (= condMapEmpty!11643 (= (arr!8159 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3072)) mapDefault!11643)))))

(declare-fun mapNonEmpty!11643 () Bool)

(declare-fun tp!24140 () Bool)

(declare-fun e!205062 () Bool)

(assert (=> mapNonEmpty!11643 (= mapRes!11643 (and tp!24140 e!205062))))

(declare-fun mapKey!11643 () (_ BitVec 32))

(declare-fun mapRest!11643 () (Array (_ BitVec 32) ValueCell!3072))

(declare-fun mapValue!11643 () ValueCell!3072)

(assert (=> mapNonEmpty!11643 (= (arr!8159 _values!1525) (store mapRest!11643 mapKey!11643 mapValue!11643))))

(declare-fun b!334012 () Bool)

(assert (=> b!334012 (= e!205065 (not true))))

(declare-fun arrayContainsKey!0 (array!17255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334012 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10383 0))(
  ( (Unit!10384) )
))
(declare-fun lt!159444 () Unit!10383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17255 (_ BitVec 64) (_ BitVec 32)) Unit!10383)

(assert (=> b!334012 (= lt!159444 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14784 lt!159445)))))

(declare-fun b!334013 () Bool)

(declare-fun res!184067 () Bool)

(assert (=> b!334013 (=> (not res!184067) (not e!205064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334013 (= res!184067 (validKeyInArray!0 k0!1348))))

(declare-fun b!334014 () Bool)

(declare-fun res!184066 () Bool)

(assert (=> b!334014 (=> (not res!184066) (not e!205064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17255 (_ BitVec 32)) Bool)

(assert (=> b!334014 (= res!184066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334015 () Bool)

(declare-fun res!184064 () Bool)

(assert (=> b!334015 (=> (not res!184064) (not e!205064))))

(declare-datatypes ((List!4648 0))(
  ( (Nil!4645) (Cons!4644 (h!5500 (_ BitVec 64)) (t!9736 List!4648)) )
))
(declare-fun arrayNoDuplicates!0 (array!17255 (_ BitVec 32) List!4648) Bool)

(assert (=> b!334015 (= res!184064 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4645))))

(declare-fun b!334016 () Bool)

(declare-fun res!184065 () Bool)

(assert (=> b!334016 (=> (not res!184065) (not e!205064))))

(assert (=> b!334016 (= res!184065 (and (= (size!8511 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8510 _keys!1895) (size!8511 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334017 () Bool)

(declare-fun tp_is_empty!6831 () Bool)

(assert (=> b!334017 (= e!205063 tp_is_empty!6831)))

(declare-fun res!184062 () Bool)

(assert (=> start!33644 (=> (not res!184062) (not e!205064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33644 (= res!184062 (validMask!0 mask!2385))))

(assert (=> start!33644 e!205064))

(assert (=> start!33644 true))

(assert (=> start!33644 tp_is_empty!6831))

(assert (=> start!33644 tp!24141))

(declare-fun array_inv!6068 (array!17257) Bool)

(assert (=> start!33644 (and (array_inv!6068 _values!1525) e!205060)))

(declare-fun array_inv!6069 (array!17255) Bool)

(assert (=> start!33644 (array_inv!6069 _keys!1895)))

(declare-fun b!334011 () Bool)

(declare-fun res!184060 () Bool)

(assert (=> b!334011 (=> (not res!184060) (not e!205065))))

(assert (=> b!334011 (= res!184060 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14784 lt!159445)))))

(declare-fun mapIsEmpty!11643 () Bool)

(assert (=> mapIsEmpty!11643 mapRes!11643))

(declare-fun b!334018 () Bool)

(assert (=> b!334018 (= e!205062 tp_is_empty!6831)))

(assert (= (and start!33644 res!184062) b!334016))

(assert (= (and b!334016 res!184065) b!334014))

(assert (= (and b!334014 res!184066) b!334015))

(assert (= (and b!334015 res!184064) b!334013))

(assert (= (and b!334013 res!184067) b!334008))

(assert (= (and b!334008 res!184063) b!334009))

(assert (= (and b!334009 res!184061) b!334011))

(assert (= (and b!334011 res!184060) b!334012))

(assert (= (and b!334010 condMapEmpty!11643) mapIsEmpty!11643))

(assert (= (and b!334010 (not condMapEmpty!11643)) mapNonEmpty!11643))

(assert (= (and mapNonEmpty!11643 ((_ is ValueCellFull!3072) mapValue!11643)) b!334018))

(assert (= (and b!334010 ((_ is ValueCellFull!3072) mapDefault!11643)) b!334017))

(assert (= start!33644 b!334010))

(declare-fun m!338137 () Bool)

(assert (=> mapNonEmpty!11643 m!338137))

(declare-fun m!338139 () Bool)

(assert (=> start!33644 m!338139))

(declare-fun m!338141 () Bool)

(assert (=> start!33644 m!338141))

(declare-fun m!338143 () Bool)

(assert (=> start!33644 m!338143))

(declare-fun m!338145 () Bool)

(assert (=> b!334008 m!338145))

(assert (=> b!334008 m!338145))

(declare-fun m!338147 () Bool)

(assert (=> b!334008 m!338147))

(declare-fun m!338149 () Bool)

(assert (=> b!334009 m!338149))

(declare-fun m!338151 () Bool)

(assert (=> b!334009 m!338151))

(declare-fun m!338153 () Bool)

(assert (=> b!334015 m!338153))

(declare-fun m!338155 () Bool)

(assert (=> b!334014 m!338155))

(declare-fun m!338157 () Bool)

(assert (=> b!334013 m!338157))

(declare-fun m!338159 () Bool)

(assert (=> b!334011 m!338159))

(declare-fun m!338161 () Bool)

(assert (=> b!334012 m!338161))

(declare-fun m!338163 () Bool)

(assert (=> b!334012 m!338163))

(check-sat b_and!14059 (not b!334012) (not b!334015) (not b!334013) (not mapNonEmpty!11643) (not start!33644) tp_is_empty!6831 (not b!334008) (not b_next!6879) (not b!334011) (not b!334014) (not b!334009))
(check-sat b_and!14059 (not b_next!6879))
