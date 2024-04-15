; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35820 () Bool)

(assert start!35820)

(declare-fun b!359809 () Bool)

(declare-fun res!200068 () Bool)

(declare-fun e!220353 () Bool)

(assert (=> b!359809 (=> (not res!200068) (not e!220353))))

(declare-datatypes ((array!20099 0))(
  ( (array!20100 (arr!9543 (Array (_ BitVec 32) (_ BitVec 64))) (size!9896 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20099)

(declare-datatypes ((List!5450 0))(
  ( (Nil!5447) (Cons!5446 (h!6302 (_ BitVec 64)) (t!10591 List!5450)) )
))
(declare-fun arrayNoDuplicates!0 (array!20099 (_ BitVec 32) List!5450) Bool)

(assert (=> b!359809 (= res!200068 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5447))))

(declare-fun b!359810 () Bool)

(declare-fun res!200071 () Bool)

(assert (=> b!359810 (=> (not res!200071) (not e!220353))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!359810 (= res!200071 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9896 _keys!1456))))))

(declare-fun b!359811 () Bool)

(declare-fun res!200069 () Bool)

(assert (=> b!359811 (=> (not res!200069) (not e!220353))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!12027 0))(
  ( (V!12028 (val!4188 Int)) )
))
(declare-datatypes ((ValueCell!3800 0))(
  ( (ValueCellFull!3800 (v!6376 V!12027)) (EmptyCell!3800) )
))
(declare-datatypes ((array!20101 0))(
  ( (array!20102 (arr!9544 (Array (_ BitVec 32) ValueCell!3800)) (size!9897 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20101)

(assert (=> b!359811 (= res!200069 (and (= (size!9897 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9896 _keys!1456) (size!9897 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359812 () Bool)

(declare-fun res!200072 () Bool)

(assert (=> b!359812 (=> (not res!200072) (not e!220353))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359812 (= res!200072 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13938 () Bool)

(declare-fun mapRes!13938 () Bool)

(assert (=> mapIsEmpty!13938 mapRes!13938))

(declare-fun b!359813 () Bool)

(declare-fun res!200070 () Bool)

(assert (=> b!359813 (=> (not res!200070) (not e!220353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20099 (_ BitVec 32)) Bool)

(assert (=> b!359813 (= res!200070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13938 () Bool)

(declare-fun tp!28005 () Bool)

(declare-fun e!220355 () Bool)

(assert (=> mapNonEmpty!13938 (= mapRes!13938 (and tp!28005 e!220355))))

(declare-fun mapRest!13938 () (Array (_ BitVec 32) ValueCell!3800))

(declare-fun mapValue!13938 () ValueCell!3800)

(declare-fun mapKey!13938 () (_ BitVec 32))

(assert (=> mapNonEmpty!13938 (= (arr!9544 _values!1208) (store mapRest!13938 mapKey!13938 mapValue!13938))))

(declare-fun b!359814 () Bool)

(declare-fun res!200067 () Bool)

(assert (=> b!359814 (=> (not res!200067) (not e!220353))))

(assert (=> b!359814 (= res!200067 (not (= (select (arr!9543 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!359815 () Bool)

(declare-fun tp_is_empty!8287 () Bool)

(assert (=> b!359815 (= e!220355 tp_is_empty!8287)))

(declare-fun res!200074 () Bool)

(assert (=> start!35820 (=> (not res!200074) (not e!220353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35820 (= res!200074 (validMask!0 mask!1842))))

(assert (=> start!35820 e!220353))

(assert (=> start!35820 tp_is_empty!8287))

(assert (=> start!35820 true))

(declare-fun array_inv!7036 (array!20099) Bool)

(assert (=> start!35820 (array_inv!7036 _keys!1456)))

(declare-fun e!220352 () Bool)

(declare-fun array_inv!7037 (array!20101) Bool)

(assert (=> start!35820 (and (array_inv!7037 _values!1208) e!220352)))

(declare-fun b!359816 () Bool)

(declare-fun e!220354 () Bool)

(assert (=> b!359816 (= e!220354 tp_is_empty!8287)))

(declare-fun b!359817 () Bool)

(assert (=> b!359817 (= e!220353 (not true))))

(assert (=> b!359817 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!11052 0))(
  ( (Unit!11053) )
))
(declare-fun lt!166183 () Unit!11052)

(declare-fun minValue!1150 () V!12027)

(declare-fun zeroValue!1150 () V!12027)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!49 (array!20099 array!20101 (_ BitVec 32) (_ BitVec 32) V!12027 V!12027 (_ BitVec 64) (_ BitVec 32)) Unit!11052)

(assert (=> b!359817 (= lt!166183 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!49 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!359818 () Bool)

(assert (=> b!359818 (= e!220352 (and e!220354 mapRes!13938))))

(declare-fun condMapEmpty!13938 () Bool)

(declare-fun mapDefault!13938 () ValueCell!3800)

(assert (=> b!359818 (= condMapEmpty!13938 (= (arr!9544 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3800)) mapDefault!13938)))))

(declare-fun b!359819 () Bool)

(declare-fun res!200073 () Bool)

(assert (=> b!359819 (=> (not res!200073) (not e!220353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359819 (= res!200073 (validKeyInArray!0 k0!1077))))

(assert (= (and start!35820 res!200074) b!359811))

(assert (= (and b!359811 res!200069) b!359813))

(assert (= (and b!359813 res!200070) b!359809))

(assert (= (and b!359809 res!200068) b!359819))

(assert (= (and b!359819 res!200073) b!359810))

(assert (= (and b!359810 res!200071) b!359812))

(assert (= (and b!359812 res!200072) b!359814))

(assert (= (and b!359814 res!200067) b!359817))

(assert (= (and b!359818 condMapEmpty!13938) mapIsEmpty!13938))

(assert (= (and b!359818 (not condMapEmpty!13938)) mapNonEmpty!13938))

(get-info :version)

(assert (= (and mapNonEmpty!13938 ((_ is ValueCellFull!3800) mapValue!13938)) b!359815))

(assert (= (and b!359818 ((_ is ValueCellFull!3800) mapDefault!13938)) b!359816))

(assert (= start!35820 b!359818))

(declare-fun m!356637 () Bool)

(assert (=> mapNonEmpty!13938 m!356637))

(declare-fun m!356639 () Bool)

(assert (=> b!359813 m!356639))

(declare-fun m!356641 () Bool)

(assert (=> b!359809 m!356641))

(declare-fun m!356643 () Bool)

(assert (=> start!35820 m!356643))

(declare-fun m!356645 () Bool)

(assert (=> start!35820 m!356645))

(declare-fun m!356647 () Bool)

(assert (=> start!35820 m!356647))

(declare-fun m!356649 () Bool)

(assert (=> b!359814 m!356649))

(declare-fun m!356651 () Bool)

(assert (=> b!359819 m!356651))

(declare-fun m!356653 () Bool)

(assert (=> b!359817 m!356653))

(declare-fun m!356655 () Bool)

(assert (=> b!359817 m!356655))

(declare-fun m!356657 () Bool)

(assert (=> b!359812 m!356657))

(check-sat (not b!359813) (not mapNonEmpty!13938) (not b!359809) (not b!359817) tp_is_empty!8287 (not start!35820) (not b!359819) (not b!359812))
(check-sat)
