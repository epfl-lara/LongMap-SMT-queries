; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38240 () Bool)

(assert start!38240)

(declare-fun b!394652 () Bool)

(declare-fun e!238913 () Bool)

(declare-fun tp_is_empty!9763 () Bool)

(assert (=> b!394652 (= e!238913 tp_is_empty!9763)))

(declare-fun mapNonEmpty!16245 () Bool)

(declare-fun mapRes!16245 () Bool)

(declare-fun tp!32040 () Bool)

(assert (=> mapNonEmpty!16245 (= mapRes!16245 (and tp!32040 e!238913))))

(declare-datatypes ((V!14123 0))(
  ( (V!14124 (val!4926 Int)) )
))
(declare-datatypes ((ValueCell!4538 0))(
  ( (ValueCellFull!4538 (v!7172 V!14123)) (EmptyCell!4538) )
))
(declare-fun mapRest!16245 () (Array (_ BitVec 32) ValueCell!4538))

(declare-fun mapKey!16245 () (_ BitVec 32))

(declare-datatypes ((array!23422 0))(
  ( (array!23423 (arr!11167 (Array (_ BitVec 32) ValueCell!4538)) (size!11519 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23422)

(declare-fun mapValue!16245 () ValueCell!4538)

(assert (=> mapNonEmpty!16245 (= (arr!11167 _values!549) (store mapRest!16245 mapKey!16245 mapValue!16245))))

(declare-fun b!394653 () Bool)

(declare-fun e!238910 () Bool)

(declare-datatypes ((array!23424 0))(
  ( (array!23425 (arr!11168 (Array (_ BitVec 32) (_ BitVec 64))) (size!11520 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23424)

(assert (=> b!394653 (= e!238910 (bvsgt #b00000000000000000000000000000000 (size!11520 _keys!709)))))

(declare-fun b!394654 () Bool)

(declare-fun res!226244 () Bool)

(assert (=> b!394654 (=> (not res!226244) (not e!238910))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23424 (_ BitVec 32)) Bool)

(assert (=> b!394654 (= res!226244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394655 () Bool)

(declare-fun e!238911 () Bool)

(assert (=> b!394655 (= e!238911 tp_is_empty!9763)))

(declare-fun mapIsEmpty!16245 () Bool)

(assert (=> mapIsEmpty!16245 mapRes!16245))

(declare-fun b!394651 () Bool)

(declare-fun res!226241 () Bool)

(assert (=> b!394651 (=> (not res!226241) (not e!238910))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!394651 (= res!226241 (and (= (size!11519 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11520 _keys!709) (size!11519 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!226242 () Bool)

(assert (=> start!38240 (=> (not res!226242) (not e!238910))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38240 (= res!226242 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11520 _keys!709))))))

(assert (=> start!38240 e!238910))

(assert (=> start!38240 true))

(declare-fun e!238914 () Bool)

(declare-fun array_inv!8254 (array!23422) Bool)

(assert (=> start!38240 (and (array_inv!8254 _values!549) e!238914)))

(declare-fun array_inv!8255 (array!23424) Bool)

(assert (=> start!38240 (array_inv!8255 _keys!709)))

(declare-fun b!394656 () Bool)

(assert (=> b!394656 (= e!238914 (and e!238911 mapRes!16245))))

(declare-fun condMapEmpty!16245 () Bool)

(declare-fun mapDefault!16245 () ValueCell!4538)

(assert (=> b!394656 (= condMapEmpty!16245 (= (arr!11167 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4538)) mapDefault!16245)))))

(declare-fun b!394657 () Bool)

(declare-fun res!226243 () Bool)

(assert (=> b!394657 (=> (not res!226243) (not e!238910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394657 (= res!226243 (validMask!0 mask!1025))))

(assert (= (and start!38240 res!226242) b!394657))

(assert (= (and b!394657 res!226243) b!394651))

(assert (= (and b!394651 res!226241) b!394654))

(assert (= (and b!394654 res!226244) b!394653))

(assert (= (and b!394656 condMapEmpty!16245) mapIsEmpty!16245))

(assert (= (and b!394656 (not condMapEmpty!16245)) mapNonEmpty!16245))

(get-info :version)

(assert (= (and mapNonEmpty!16245 ((_ is ValueCellFull!4538) mapValue!16245)) b!394652))

(assert (= (and b!394656 ((_ is ValueCellFull!4538) mapDefault!16245)) b!394655))

(assert (= start!38240 b!394656))

(declare-fun m!391317 () Bool)

(assert (=> mapNonEmpty!16245 m!391317))

(declare-fun m!391319 () Bool)

(assert (=> b!394654 m!391319))

(declare-fun m!391321 () Bool)

(assert (=> start!38240 m!391321))

(declare-fun m!391323 () Bool)

(assert (=> start!38240 m!391323))

(declare-fun m!391325 () Bool)

(assert (=> b!394657 m!391325))

(check-sat (not b!394657) (not start!38240) (not mapNonEmpty!16245) tp_is_empty!9763 (not b!394654))
(check-sat)
