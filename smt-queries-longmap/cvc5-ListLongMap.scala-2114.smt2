; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35852 () Bool)

(assert start!35852)

(declare-fun b!360381 () Bool)

(declare-fun res!200417 () Bool)

(declare-fun e!220667 () Bool)

(assert (=> b!360381 (=> (not res!200417) (not e!220667))))

(declare-datatypes ((array!20161 0))(
  ( (array!20162 (arr!9574 (Array (_ BitVec 32) (_ BitVec 64))) (size!9926 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20161)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20161 (_ BitVec 32)) Bool)

(assert (=> b!360381 (= res!200417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360382 () Bool)

(declare-fun res!200418 () Bool)

(assert (=> b!360382 (=> (not res!200418) (not e!220667))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!360382 (= res!200418 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9926 _keys!1456))))))

(declare-fun b!360383 () Bool)

(declare-fun res!200415 () Bool)

(assert (=> b!360383 (=> (not res!200415) (not e!220667))))

(declare-datatypes ((List!5487 0))(
  ( (Nil!5484) (Cons!5483 (h!6339 (_ BitVec 64)) (t!10637 List!5487)) )
))
(declare-fun arrayNoDuplicates!0 (array!20161 (_ BitVec 32) List!5487) Bool)

(assert (=> b!360383 (= res!200415 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5484))))

(declare-fun b!360385 () Bool)

(declare-fun e!220663 () Bool)

(declare-fun tp_is_empty!8305 () Bool)

(assert (=> b!360385 (= e!220663 tp_is_empty!8305)))

(declare-fun b!360386 () Bool)

(declare-fun res!200414 () Bool)

(assert (=> b!360386 (=> (not res!200414) (not e!220667))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360386 (= res!200414 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!360387 () Bool)

(declare-fun res!200413 () Bool)

(assert (=> b!360387 (=> (not res!200413) (not e!220667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360387 (= res!200413 (validKeyInArray!0 k!1077))))

(declare-fun b!360388 () Bool)

(declare-fun res!200412 () Bool)

(assert (=> b!360388 (=> (not res!200412) (not e!220667))))

(declare-datatypes ((V!12051 0))(
  ( (V!12052 (val!4197 Int)) )
))
(declare-datatypes ((ValueCell!3809 0))(
  ( (ValueCellFull!3809 (v!6391 V!12051)) (EmptyCell!3809) )
))
(declare-datatypes ((array!20163 0))(
  ( (array!20164 (arr!9575 (Array (_ BitVec 32) ValueCell!3809)) (size!9927 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20163)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!360388 (= res!200412 (and (= (size!9927 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9926 _keys!1456) (size!9927 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13965 () Bool)

(declare-fun mapRes!13965 () Bool)

(assert (=> mapIsEmpty!13965 mapRes!13965))

(declare-fun b!360389 () Bool)

(declare-fun e!220665 () Bool)

(assert (=> b!360389 (= e!220665 tp_is_empty!8305)))

(declare-fun mapNonEmpty!13965 () Bool)

(declare-fun tp!28032 () Bool)

(assert (=> mapNonEmpty!13965 (= mapRes!13965 (and tp!28032 e!220665))))

(declare-fun mapRest!13965 () (Array (_ BitVec 32) ValueCell!3809))

(declare-fun mapKey!13965 () (_ BitVec 32))

(declare-fun mapValue!13965 () ValueCell!3809)

(assert (=> mapNonEmpty!13965 (= (arr!9575 _values!1208) (store mapRest!13965 mapKey!13965 mapValue!13965))))

(declare-fun b!360390 () Bool)

(declare-fun res!200416 () Bool)

(assert (=> b!360390 (=> (not res!200416) (not e!220667))))

(assert (=> b!360390 (= res!200416 (not (= (select (arr!9574 _keys!1456) from!1805) k!1077)))))

(declare-fun b!360391 () Bool)

(assert (=> b!360391 (= e!220667 (not true))))

(assert (=> b!360391 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12051)

(declare-fun zeroValue!1150 () V!12051)

(declare-datatypes ((Unit!11084 0))(
  ( (Unit!11085) )
))
(declare-fun lt!166445 () Unit!11084)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!57 (array!20161 array!20163 (_ BitVec 32) (_ BitVec 32) V!12051 V!12051 (_ BitVec 64) (_ BitVec 32)) Unit!11084)

(assert (=> b!360391 (= lt!166445 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!57 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun res!200419 () Bool)

(assert (=> start!35852 (=> (not res!200419) (not e!220667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35852 (= res!200419 (validMask!0 mask!1842))))

(assert (=> start!35852 e!220667))

(assert (=> start!35852 tp_is_empty!8305))

(assert (=> start!35852 true))

(declare-fun array_inv!7042 (array!20161) Bool)

(assert (=> start!35852 (array_inv!7042 _keys!1456)))

(declare-fun e!220664 () Bool)

(declare-fun array_inv!7043 (array!20163) Bool)

(assert (=> start!35852 (and (array_inv!7043 _values!1208) e!220664)))

(declare-fun b!360384 () Bool)

(assert (=> b!360384 (= e!220664 (and e!220663 mapRes!13965))))

(declare-fun condMapEmpty!13965 () Bool)

(declare-fun mapDefault!13965 () ValueCell!3809)

