; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35832 () Bool)

(assert start!35832)

(declare-fun mapIsEmpty!13956 () Bool)

(declare-fun mapRes!13956 () Bool)

(assert (=> mapIsEmpty!13956 mapRes!13956))

(declare-fun b!360007 () Bool)

(declare-fun res!200216 () Bool)

(declare-fun e!220446 () Bool)

(assert (=> b!360007 (=> (not res!200216) (not e!220446))))

(declare-datatypes ((array!20123 0))(
  ( (array!20124 (arr!9555 (Array (_ BitVec 32) (_ BitVec 64))) (size!9908 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20123)

(declare-datatypes ((List!5455 0))(
  ( (Nil!5452) (Cons!5451 (h!6307 (_ BitVec 64)) (t!10596 List!5455)) )
))
(declare-fun arrayNoDuplicates!0 (array!20123 (_ BitVec 32) List!5455) Bool)

(assert (=> b!360007 (= res!200216 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5452))))

(declare-fun b!360008 () Bool)

(declare-fun res!200215 () Bool)

(assert (=> b!360008 (=> (not res!200215) (not e!220446))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20123 (_ BitVec 32)) Bool)

(assert (=> b!360008 (= res!200215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360009 () Bool)

(declare-fun e!220442 () Bool)

(declare-fun tp_is_empty!8299 () Bool)

(assert (=> b!360009 (= e!220442 tp_is_empty!8299)))

(declare-fun b!360010 () Bool)

(declare-fun res!200212 () Bool)

(assert (=> b!360010 (=> (not res!200212) (not e!220446))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360010 (= res!200212 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360011 () Bool)

(declare-fun e!220443 () Bool)

(assert (=> b!360011 (= e!220443 tp_is_empty!8299)))

(declare-fun res!200211 () Bool)

(assert (=> start!35832 (=> (not res!200211) (not e!220446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35832 (= res!200211 (validMask!0 mask!1842))))

(assert (=> start!35832 e!220446))

(assert (=> start!35832 tp_is_empty!8299))

(assert (=> start!35832 true))

(declare-fun array_inv!7044 (array!20123) Bool)

(assert (=> start!35832 (array_inv!7044 _keys!1456)))

(declare-datatypes ((V!12043 0))(
  ( (V!12044 (val!4194 Int)) )
))
(declare-datatypes ((ValueCell!3806 0))(
  ( (ValueCellFull!3806 (v!6382 V!12043)) (EmptyCell!3806) )
))
(declare-datatypes ((array!20125 0))(
  ( (array!20126 (arr!9556 (Array (_ BitVec 32) ValueCell!3806)) (size!9909 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20125)

(declare-fun e!220445 () Bool)

(declare-fun array_inv!7045 (array!20125) Bool)

(assert (=> start!35832 (and (array_inv!7045 _values!1208) e!220445)))

(declare-fun b!360012 () Bool)

(declare-fun res!200218 () Bool)

(assert (=> b!360012 (=> (not res!200218) (not e!220446))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!360012 (= res!200218 (and (= (size!9909 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9908 _keys!1456) (size!9909 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360013 () Bool)

(declare-fun res!200214 () Bool)

(assert (=> b!360013 (=> (not res!200214) (not e!220446))))

(assert (=> b!360013 (= res!200214 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9908 _keys!1456))))))

(declare-fun mapNonEmpty!13956 () Bool)

(declare-fun tp!28023 () Bool)

(assert (=> mapNonEmpty!13956 (= mapRes!13956 (and tp!28023 e!220442))))

(declare-fun mapRest!13956 () (Array (_ BitVec 32) ValueCell!3806))

(declare-fun mapKey!13956 () (_ BitVec 32))

(declare-fun mapValue!13956 () ValueCell!3806)

(assert (=> mapNonEmpty!13956 (= (arr!9556 _values!1208) (store mapRest!13956 mapKey!13956 mapValue!13956))))

(declare-fun b!360014 () Bool)

(declare-fun res!200213 () Bool)

(assert (=> b!360014 (=> (not res!200213) (not e!220446))))

(assert (=> b!360014 (= res!200213 (not (= (select (arr!9555 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360015 () Bool)

(assert (=> b!360015 (= e!220445 (and e!220443 mapRes!13956))))

(declare-fun condMapEmpty!13956 () Bool)

(declare-fun mapDefault!13956 () ValueCell!3806)

(assert (=> b!360015 (= condMapEmpty!13956 (= (arr!9556 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3806)) mapDefault!13956)))))

(declare-fun b!360016 () Bool)

(assert (=> b!360016 (= e!220446 (not true))))

(assert (=> b!360016 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12043)

(declare-datatypes ((Unit!11062 0))(
  ( (Unit!11063) )
))
(declare-fun lt!166201 () Unit!11062)

(declare-fun zeroValue!1150 () V!12043)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!54 (array!20123 array!20125 (_ BitVec 32) (_ BitVec 32) V!12043 V!12043 (_ BitVec 64) (_ BitVec 32)) Unit!11062)

(assert (=> b!360016 (= lt!166201 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!54 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360017 () Bool)

(declare-fun res!200217 () Bool)

(assert (=> b!360017 (=> (not res!200217) (not e!220446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360017 (= res!200217 (validKeyInArray!0 k0!1077))))

(assert (= (and start!35832 res!200211) b!360012))

(assert (= (and b!360012 res!200218) b!360008))

(assert (= (and b!360008 res!200215) b!360007))

(assert (= (and b!360007 res!200216) b!360017))

(assert (= (and b!360017 res!200217) b!360013))

(assert (= (and b!360013 res!200214) b!360010))

(assert (= (and b!360010 res!200212) b!360014))

(assert (= (and b!360014 res!200213) b!360016))

(assert (= (and b!360015 condMapEmpty!13956) mapIsEmpty!13956))

(assert (= (and b!360015 (not condMapEmpty!13956)) mapNonEmpty!13956))

(get-info :version)

(assert (= (and mapNonEmpty!13956 ((_ is ValueCellFull!3806) mapValue!13956)) b!360009))

(assert (= (and b!360015 ((_ is ValueCellFull!3806) mapDefault!13956)) b!360011))

(assert (= start!35832 b!360015))

(declare-fun m!356769 () Bool)

(assert (=> b!360007 m!356769))

(declare-fun m!356771 () Bool)

(assert (=> b!360016 m!356771))

(declare-fun m!356773 () Bool)

(assert (=> b!360016 m!356773))

(declare-fun m!356775 () Bool)

(assert (=> b!360014 m!356775))

(declare-fun m!356777 () Bool)

(assert (=> b!360010 m!356777))

(declare-fun m!356779 () Bool)

(assert (=> b!360008 m!356779))

(declare-fun m!356781 () Bool)

(assert (=> b!360017 m!356781))

(declare-fun m!356783 () Bool)

(assert (=> mapNonEmpty!13956 m!356783))

(declare-fun m!356785 () Bool)

(assert (=> start!35832 m!356785))

(declare-fun m!356787 () Bool)

(assert (=> start!35832 m!356787))

(declare-fun m!356789 () Bool)

(assert (=> start!35832 m!356789))

(check-sat (not b!360008) (not b!360016) (not start!35832) (not b!360017) tp_is_empty!8299 (not b!360007) (not b!360010) (not mapNonEmpty!13956))
(check-sat)
