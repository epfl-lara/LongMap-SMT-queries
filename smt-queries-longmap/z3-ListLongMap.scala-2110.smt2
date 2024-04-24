; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35814 () Bool)

(assert start!35814)

(declare-fun mapNonEmpty!13929 () Bool)

(declare-fun mapRes!13929 () Bool)

(declare-fun tp!27996 () Bool)

(declare-fun e!220451 () Bool)

(assert (=> mapNonEmpty!13929 (= mapRes!13929 (and tp!27996 e!220451))))

(declare-datatypes ((V!12019 0))(
  ( (V!12020 (val!4185 Int)) )
))
(declare-datatypes ((ValueCell!3797 0))(
  ( (ValueCellFull!3797 (v!6380 V!12019)) (EmptyCell!3797) )
))
(declare-fun mapRest!13929 () (Array (_ BitVec 32) ValueCell!3797))

(declare-fun mapKey!13929 () (_ BitVec 32))

(declare-fun mapValue!13929 () ValueCell!3797)

(declare-datatypes ((array!20096 0))(
  ( (array!20097 (arr!9541 (Array (_ BitVec 32) ValueCell!3797)) (size!9893 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20096)

(assert (=> mapNonEmpty!13929 (= (arr!9541 _values!1208) (store mapRest!13929 mapKey!13929 mapValue!13929))))

(declare-fun b!359932 () Bool)

(declare-fun res!200121 () Bool)

(declare-fun e!220453 () Bool)

(assert (=> b!359932 (=> (not res!200121) (not e!220453))))

(declare-datatypes ((array!20098 0))(
  ( (array!20099 (arr!9542 (Array (_ BitVec 32) (_ BitVec 64))) (size!9894 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20098)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!359932 (= res!200121 (not (= (select (arr!9542 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!359933 () Bool)

(declare-fun res!200125 () Bool)

(assert (=> b!359933 (=> (not res!200125) (not e!220453))))

(declare-fun arrayContainsKey!0 (array!20098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359933 (= res!200125 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!359934 () Bool)

(declare-fun tp_is_empty!8281 () Bool)

(assert (=> b!359934 (= e!220451 tp_is_empty!8281)))

(declare-fun res!200124 () Bool)

(assert (=> start!35814 (=> (not res!200124) (not e!220453))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35814 (= res!200124 (validMask!0 mask!1842))))

(assert (=> start!35814 e!220453))

(assert (=> start!35814 tp_is_empty!8281))

(assert (=> start!35814 true))

(declare-fun array_inv!7054 (array!20098) Bool)

(assert (=> start!35814 (array_inv!7054 _keys!1456)))

(declare-fun e!220452 () Bool)

(declare-fun array_inv!7055 (array!20096) Bool)

(assert (=> start!35814 (and (array_inv!7055 _values!1208) e!220452)))

(declare-fun b!359935 () Bool)

(declare-fun res!200128 () Bool)

(assert (=> b!359935 (=> (not res!200128) (not e!220453))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359935 (= res!200128 (and (= (size!9893 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9894 _keys!1456) (size!9893 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359936 () Bool)

(declare-fun res!200122 () Bool)

(assert (=> b!359936 (=> (not res!200122) (not e!220453))))

(declare-datatypes ((List!5391 0))(
  ( (Nil!5388) (Cons!5387 (h!6243 (_ BitVec 64)) (t!10533 List!5391)) )
))
(declare-fun arrayNoDuplicates!0 (array!20098 (_ BitVec 32) List!5391) Bool)

(assert (=> b!359936 (= res!200122 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5388))))

(declare-fun b!359937 () Bool)

(declare-fun res!200123 () Bool)

(assert (=> b!359937 (=> (not res!200123) (not e!220453))))

(assert (=> b!359937 (= res!200123 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9894 _keys!1456))))))

(declare-fun b!359938 () Bool)

(declare-fun e!220450 () Bool)

(assert (=> b!359938 (= e!220450 tp_is_empty!8281)))

(declare-fun b!359939 () Bool)

(assert (=> b!359939 (= e!220453 (not true))))

(assert (=> b!359939 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12019)

(declare-datatypes ((Unit!11053 0))(
  ( (Unit!11054) )
))
(declare-fun lt!166427 () Unit!11053)

(declare-fun zeroValue!1150 () V!12019)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!48 (array!20098 array!20096 (_ BitVec 32) (_ BitVec 32) V!12019 V!12019 (_ BitVec 64) (_ BitVec 32)) Unit!11053)

(assert (=> b!359939 (= lt!166427 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!48 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!359940 () Bool)

(declare-fun res!200127 () Bool)

(assert (=> b!359940 (=> (not res!200127) (not e!220453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359940 (= res!200127 (validKeyInArray!0 k0!1077))))

(declare-fun b!359941 () Bool)

(declare-fun res!200126 () Bool)

(assert (=> b!359941 (=> (not res!200126) (not e!220453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20098 (_ BitVec 32)) Bool)

(assert (=> b!359941 (= res!200126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13929 () Bool)

(assert (=> mapIsEmpty!13929 mapRes!13929))

(declare-fun b!359942 () Bool)

(assert (=> b!359942 (= e!220452 (and e!220450 mapRes!13929))))

(declare-fun condMapEmpty!13929 () Bool)

(declare-fun mapDefault!13929 () ValueCell!3797)

(assert (=> b!359942 (= condMapEmpty!13929 (= (arr!9541 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3797)) mapDefault!13929)))))

(assert (= (and start!35814 res!200124) b!359935))

(assert (= (and b!359935 res!200128) b!359941))

(assert (= (and b!359941 res!200126) b!359936))

(assert (= (and b!359936 res!200122) b!359940))

(assert (= (and b!359940 res!200127) b!359937))

(assert (= (and b!359937 res!200123) b!359933))

(assert (= (and b!359933 res!200125) b!359932))

(assert (= (and b!359932 res!200121) b!359939))

(assert (= (and b!359942 condMapEmpty!13929) mapIsEmpty!13929))

(assert (= (and b!359942 (not condMapEmpty!13929)) mapNonEmpty!13929))

(get-info :version)

(assert (= (and mapNonEmpty!13929 ((_ is ValueCellFull!3797) mapValue!13929)) b!359934))

(assert (= (and b!359942 ((_ is ValueCellFull!3797) mapDefault!13929)) b!359938))

(assert (= start!35814 b!359942))

(declare-fun m!357525 () Bool)

(assert (=> start!35814 m!357525))

(declare-fun m!357527 () Bool)

(assert (=> start!35814 m!357527))

(declare-fun m!357529 () Bool)

(assert (=> start!35814 m!357529))

(declare-fun m!357531 () Bool)

(assert (=> b!359932 m!357531))

(declare-fun m!357533 () Bool)

(assert (=> mapNonEmpty!13929 m!357533))

(declare-fun m!357535 () Bool)

(assert (=> b!359936 m!357535))

(declare-fun m!357537 () Bool)

(assert (=> b!359939 m!357537))

(declare-fun m!357539 () Bool)

(assert (=> b!359939 m!357539))

(declare-fun m!357541 () Bool)

(assert (=> b!359941 m!357541))

(declare-fun m!357543 () Bool)

(assert (=> b!359940 m!357543))

(declare-fun m!357545 () Bool)

(assert (=> b!359933 m!357545))

(check-sat (not b!359940) (not b!359939) (not b!359941) tp_is_empty!8281 (not mapNonEmpty!13929) (not start!35814) (not b!359936) (not b!359933))
(check-sat)
