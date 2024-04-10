; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33638 () Bool)

(assert start!33638)

(declare-fun b_free!6873 () Bool)

(declare-fun b_next!6873 () Bool)

(assert (=> start!33638 (= b_free!6873 (not b_next!6873))))

(declare-fun tp!24123 () Bool)

(declare-fun b_and!14053 () Bool)

(assert (=> start!33638 (= tp!24123 b_and!14053)))

(declare-fun b!333909 () Bool)

(declare-fun res!183995 () Bool)

(declare-fun e!205006 () Bool)

(assert (=> b!333909 (=> (not res!183995) (not e!205006))))

(declare-datatypes ((array!17243 0))(
  ( (array!17244 (arr!8152 (Array (_ BitVec 32) (_ BitVec 64))) (size!8504 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17243)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17243 (_ BitVec 32)) Bool)

(assert (=> b!333909 (= res!183995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333910 () Bool)

(declare-fun res!183991 () Bool)

(declare-fun e!205007 () Bool)

(assert (=> b!333910 (=> (not res!183991) (not e!205007))))

(declare-datatypes ((SeekEntryResult!3148 0))(
  ( (MissingZero!3148 (index!14771 (_ BitVec 32))) (Found!3148 (index!14772 (_ BitVec 32))) (Intermediate!3148 (undefined!3960 Bool) (index!14773 (_ BitVec 32)) (x!33266 (_ BitVec 32))) (Undefined!3148) (MissingVacant!3148 (index!14774 (_ BitVec 32))) )
))
(declare-fun lt!159427 () SeekEntryResult!3148)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333910 (= res!183991 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14772 lt!159427)))))

(declare-fun b!333911 () Bool)

(declare-fun e!205011 () Bool)

(declare-fun tp_is_empty!6825 () Bool)

(assert (=> b!333911 (= e!205011 tp_is_empty!6825)))

(declare-fun b!333913 () Bool)

(declare-fun e!205008 () Bool)

(assert (=> b!333913 (= e!205008 tp_is_empty!6825)))

(declare-fun b!333914 () Bool)

(declare-fun res!183993 () Bool)

(assert (=> b!333914 (=> (not res!183993) (not e!205006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333914 (= res!183993 (validKeyInArray!0 k0!1348))))

(declare-fun b!333915 () Bool)

(assert (=> b!333915 (= e!205007 (not true))))

(assert (=> b!333915 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10377 0))(
  ( (Unit!10378) )
))
(declare-fun lt!159426 () Unit!10377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17243 (_ BitVec 64) (_ BitVec 32)) Unit!10377)

(assert (=> b!333915 (= lt!159426 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14772 lt!159427)))))

(declare-fun b!333916 () Bool)

(assert (=> b!333916 (= e!205006 e!205007)))

(declare-fun res!183994 () Bool)

(assert (=> b!333916 (=> (not res!183994) (not e!205007))))

(get-info :version)

(assert (=> b!333916 (= res!183994 (and ((_ is Found!3148) lt!159427) (= (select (arr!8152 _keys!1895) (index!14772 lt!159427)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17243 (_ BitVec 32)) SeekEntryResult!3148)

(assert (=> b!333916 (= lt!159427 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333917 () Bool)

(declare-fun res!183988 () Bool)

(assert (=> b!333917 (=> (not res!183988) (not e!205006))))

(declare-datatypes ((V!10077 0))(
  ( (V!10078 (val!3457 Int)) )
))
(declare-fun zeroValue!1467 () V!10077)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3069 0))(
  ( (ValueCellFull!3069 (v!5619 V!10077)) (EmptyCell!3069) )
))
(declare-datatypes ((array!17245 0))(
  ( (array!17246 (arr!8153 (Array (_ BitVec 32) ValueCell!3069)) (size!8505 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17245)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10077)

(declare-datatypes ((tuple2!5022 0))(
  ( (tuple2!5023 (_1!2522 (_ BitVec 64)) (_2!2522 V!10077)) )
))
(declare-datatypes ((List!4642 0))(
  ( (Nil!4639) (Cons!4638 (h!5494 tuple2!5022) (t!9730 List!4642)) )
))
(declare-datatypes ((ListLongMap!3935 0))(
  ( (ListLongMap!3936 (toList!1983 List!4642)) )
))
(declare-fun contains!2027 (ListLongMap!3935 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1511 (array!17243 array!17245 (_ BitVec 32) (_ BitVec 32) V!10077 V!10077 (_ BitVec 32) Int) ListLongMap!3935)

(assert (=> b!333917 (= res!183988 (not (contains!2027 (getCurrentListMap!1511 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333918 () Bool)

(declare-fun e!205010 () Bool)

(declare-fun mapRes!11634 () Bool)

(assert (=> b!333918 (= e!205010 (and e!205011 mapRes!11634))))

(declare-fun condMapEmpty!11634 () Bool)

(declare-fun mapDefault!11634 () ValueCell!3069)

(assert (=> b!333918 (= condMapEmpty!11634 (= (arr!8153 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3069)) mapDefault!11634)))))

(declare-fun mapIsEmpty!11634 () Bool)

(assert (=> mapIsEmpty!11634 mapRes!11634))

(declare-fun res!183992 () Bool)

(assert (=> start!33638 (=> (not res!183992) (not e!205006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33638 (= res!183992 (validMask!0 mask!2385))))

(assert (=> start!33638 e!205006))

(assert (=> start!33638 true))

(assert (=> start!33638 tp_is_empty!6825))

(assert (=> start!33638 tp!24123))

(declare-fun array_inv!6062 (array!17245) Bool)

(assert (=> start!33638 (and (array_inv!6062 _values!1525) e!205010)))

(declare-fun array_inv!6063 (array!17243) Bool)

(assert (=> start!33638 (array_inv!6063 _keys!1895)))

(declare-fun b!333912 () Bool)

(declare-fun res!183990 () Bool)

(assert (=> b!333912 (=> (not res!183990) (not e!205006))))

(assert (=> b!333912 (= res!183990 (and (= (size!8505 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8504 _keys!1895) (size!8505 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333919 () Bool)

(declare-fun res!183989 () Bool)

(assert (=> b!333919 (=> (not res!183989) (not e!205006))))

(declare-datatypes ((List!4643 0))(
  ( (Nil!4640) (Cons!4639 (h!5495 (_ BitVec 64)) (t!9731 List!4643)) )
))
(declare-fun arrayNoDuplicates!0 (array!17243 (_ BitVec 32) List!4643) Bool)

(assert (=> b!333919 (= res!183989 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4640))))

(declare-fun mapNonEmpty!11634 () Bool)

(declare-fun tp!24122 () Bool)

(assert (=> mapNonEmpty!11634 (= mapRes!11634 (and tp!24122 e!205008))))

(declare-fun mapRest!11634 () (Array (_ BitVec 32) ValueCell!3069))

(declare-fun mapValue!11634 () ValueCell!3069)

(declare-fun mapKey!11634 () (_ BitVec 32))

(assert (=> mapNonEmpty!11634 (= (arr!8153 _values!1525) (store mapRest!11634 mapKey!11634 mapValue!11634))))

(assert (= (and start!33638 res!183992) b!333912))

(assert (= (and b!333912 res!183990) b!333909))

(assert (= (and b!333909 res!183995) b!333919))

(assert (= (and b!333919 res!183989) b!333914))

(assert (= (and b!333914 res!183993) b!333917))

(assert (= (and b!333917 res!183988) b!333916))

(assert (= (and b!333916 res!183994) b!333910))

(assert (= (and b!333910 res!183991) b!333915))

(assert (= (and b!333918 condMapEmpty!11634) mapIsEmpty!11634))

(assert (= (and b!333918 (not condMapEmpty!11634)) mapNonEmpty!11634))

(assert (= (and mapNonEmpty!11634 ((_ is ValueCellFull!3069) mapValue!11634)) b!333913))

(assert (= (and b!333918 ((_ is ValueCellFull!3069) mapDefault!11634)) b!333911))

(assert (= start!33638 b!333918))

(declare-fun m!338053 () Bool)

(assert (=> mapNonEmpty!11634 m!338053))

(declare-fun m!338055 () Bool)

(assert (=> b!333919 m!338055))

(declare-fun m!338057 () Bool)

(assert (=> b!333909 m!338057))

(declare-fun m!338059 () Bool)

(assert (=> b!333917 m!338059))

(assert (=> b!333917 m!338059))

(declare-fun m!338061 () Bool)

(assert (=> b!333917 m!338061))

(declare-fun m!338063 () Bool)

(assert (=> b!333915 m!338063))

(declare-fun m!338065 () Bool)

(assert (=> b!333915 m!338065))

(declare-fun m!338067 () Bool)

(assert (=> b!333910 m!338067))

(declare-fun m!338069 () Bool)

(assert (=> b!333916 m!338069))

(declare-fun m!338071 () Bool)

(assert (=> b!333916 m!338071))

(declare-fun m!338073 () Bool)

(assert (=> b!333914 m!338073))

(declare-fun m!338075 () Bool)

(assert (=> start!33638 m!338075))

(declare-fun m!338077 () Bool)

(assert (=> start!33638 m!338077))

(declare-fun m!338079 () Bool)

(assert (=> start!33638 m!338079))

(check-sat (not b!333909) (not b!333910) (not b_next!6873) (not mapNonEmpty!11634) (not b!333919) b_and!14053 (not b!333915) (not b!333917) (not start!33638) tp_is_empty!6825 (not b!333916) (not b!333914))
(check-sat b_and!14053 (not b_next!6873))
