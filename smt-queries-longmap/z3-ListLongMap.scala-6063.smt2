; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78632 () Bool)

(assert start!78632)

(declare-fun b!915875 () Bool)

(declare-fun e!513989 () Bool)

(declare-fun tp_is_empty!19207 () Bool)

(assert (=> b!915875 (= e!513989 tp_is_empty!19207)))

(declare-fun b!915876 () Bool)

(declare-fun e!513986 () Bool)

(declare-datatypes ((List!18344 0))(
  ( (Nil!18341) (Cons!18340 (h!19492 (_ BitVec 64)) (t!25949 List!18344)) )
))
(declare-fun noDuplicate!1333 (List!18344) Bool)

(assert (=> b!915876 (= e!513986 (not (noDuplicate!1333 Nil!18341)))))

(declare-fun b!915877 () Bool)

(declare-fun res!617299 () Bool)

(assert (=> b!915877 (=> (not res!617299) (not e!513986))))

(declare-datatypes ((array!54471 0))(
  ( (array!54472 (arr!26178 (Array (_ BitVec 32) (_ BitVec 64))) (size!26638 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54471)

(assert (=> b!915877 (= res!617299 (and (bvsle #b00000000000000000000000000000000 (size!26638 _keys!1487)) (bvslt (size!26638 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!30561 () Bool)

(declare-fun mapRes!30561 () Bool)

(declare-fun tp!58629 () Bool)

(declare-fun e!513985 () Bool)

(assert (=> mapNonEmpty!30561 (= mapRes!30561 (and tp!58629 e!513985))))

(declare-fun mapKey!30561 () (_ BitVec 32))

(declare-datatypes ((V!30575 0))(
  ( (V!30576 (val!9654 Int)) )
))
(declare-datatypes ((ValueCell!9122 0))(
  ( (ValueCellFull!9122 (v!12168 V!30575)) (EmptyCell!9122) )
))
(declare-fun mapValue!30561 () ValueCell!9122)

(declare-fun mapRest!30561 () (Array (_ BitVec 32) ValueCell!9122))

(declare-datatypes ((array!54473 0))(
  ( (array!54474 (arr!26179 (Array (_ BitVec 32) ValueCell!9122)) (size!26639 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54473)

(assert (=> mapNonEmpty!30561 (= (arr!26179 _values!1231) (store mapRest!30561 mapKey!30561 mapValue!30561))))

(declare-fun b!915878 () Bool)

(declare-fun res!617302 () Bool)

(assert (=> b!915878 (=> (not res!617302) (not e!513986))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54471 (_ BitVec 32)) Bool)

(assert (=> b!915878 (= res!617302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915879 () Bool)

(declare-fun e!513987 () Bool)

(assert (=> b!915879 (= e!513987 (and e!513989 mapRes!30561))))

(declare-fun condMapEmpty!30561 () Bool)

(declare-fun mapDefault!30561 () ValueCell!9122)

(assert (=> b!915879 (= condMapEmpty!30561 (= (arr!26179 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9122)) mapDefault!30561)))))

(declare-fun b!915880 () Bool)

(assert (=> b!915880 (= e!513985 tp_is_empty!19207)))

(declare-fun mapIsEmpty!30561 () Bool)

(assert (=> mapIsEmpty!30561 mapRes!30561))

(declare-fun res!617301 () Bool)

(assert (=> start!78632 (=> (not res!617301) (not e!513986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78632 (= res!617301 (validMask!0 mask!1881))))

(assert (=> start!78632 e!513986))

(assert (=> start!78632 true))

(declare-fun array_inv!20534 (array!54473) Bool)

(assert (=> start!78632 (and (array_inv!20534 _values!1231) e!513987)))

(declare-fun array_inv!20535 (array!54471) Bool)

(assert (=> start!78632 (array_inv!20535 _keys!1487)))

(declare-fun b!915881 () Bool)

(declare-fun res!617300 () Bool)

(assert (=> b!915881 (=> (not res!617300) (not e!513986))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915881 (= res!617300 (and (= (size!26639 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26638 _keys!1487) (size!26639 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78632 res!617301) b!915881))

(assert (= (and b!915881 res!617300) b!915878))

(assert (= (and b!915878 res!617302) b!915877))

(assert (= (and b!915877 res!617299) b!915876))

(assert (= (and b!915879 condMapEmpty!30561) mapIsEmpty!30561))

(assert (= (and b!915879 (not condMapEmpty!30561)) mapNonEmpty!30561))

(get-info :version)

(assert (= (and mapNonEmpty!30561 ((_ is ValueCellFull!9122) mapValue!30561)) b!915880))

(assert (= (and b!915879 ((_ is ValueCellFull!9122) mapDefault!30561)) b!915875))

(assert (= start!78632 b!915879))

(declare-fun m!850803 () Bool)

(assert (=> b!915876 m!850803))

(declare-fun m!850805 () Bool)

(assert (=> mapNonEmpty!30561 m!850805))

(declare-fun m!850807 () Bool)

(assert (=> b!915878 m!850807))

(declare-fun m!850809 () Bool)

(assert (=> start!78632 m!850809))

(declare-fun m!850811 () Bool)

(assert (=> start!78632 m!850811))

(declare-fun m!850813 () Bool)

(assert (=> start!78632 m!850813))

(check-sat (not mapNonEmpty!30561) (not b!915878) tp_is_empty!19207 (not b!915876) (not start!78632))
(check-sat)
(get-model)

(declare-fun d!113047 () Bool)

(assert (=> d!113047 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78632 d!113047))

(declare-fun d!113049 () Bool)

(assert (=> d!113049 (= (array_inv!20534 _values!1231) (bvsge (size!26639 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78632 d!113049))

(declare-fun d!113051 () Bool)

(assert (=> d!113051 (= (array_inv!20535 _keys!1487) (bvsge (size!26638 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78632 d!113051))

(declare-fun d!113053 () Bool)

(declare-fun res!617331 () Bool)

(declare-fun e!514024 () Bool)

(assert (=> d!113053 (=> res!617331 e!514024)))

(assert (=> d!113053 (= res!617331 ((_ is Nil!18341) Nil!18341))))

(assert (=> d!113053 (= (noDuplicate!1333 Nil!18341) e!514024)))

(declare-fun b!915928 () Bool)

(declare-fun e!514025 () Bool)

(assert (=> b!915928 (= e!514024 e!514025)))

(declare-fun res!617332 () Bool)

(assert (=> b!915928 (=> (not res!617332) (not e!514025))))

(declare-fun contains!4690 (List!18344 (_ BitVec 64)) Bool)

(assert (=> b!915928 (= res!617332 (not (contains!4690 (t!25949 Nil!18341) (h!19492 Nil!18341))))))

(declare-fun b!915929 () Bool)

(assert (=> b!915929 (= e!514025 (noDuplicate!1333 (t!25949 Nil!18341)))))

(assert (= (and d!113053 (not res!617331)) b!915928))

(assert (= (and b!915928 res!617332) b!915929))

(declare-fun m!850839 () Bool)

(assert (=> b!915928 m!850839))

(declare-fun m!850841 () Bool)

(assert (=> b!915929 m!850841))

(assert (=> b!915876 d!113053))

(declare-fun b!915938 () Bool)

(declare-fun e!514033 () Bool)

(declare-fun call!40591 () Bool)

(assert (=> b!915938 (= e!514033 call!40591)))

(declare-fun b!915939 () Bool)

(declare-fun e!514032 () Bool)

(assert (=> b!915939 (= e!514032 call!40591)))

(declare-fun d!113055 () Bool)

(declare-fun res!617338 () Bool)

(declare-fun e!514034 () Bool)

(assert (=> d!113055 (=> res!617338 e!514034)))

(assert (=> d!113055 (= res!617338 (bvsge #b00000000000000000000000000000000 (size!26638 _keys!1487)))))

(assert (=> d!113055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!514034)))

(declare-fun b!915940 () Bool)

(assert (=> b!915940 (= e!514033 e!514032)))

(declare-fun lt!411973 () (_ BitVec 64))

(assert (=> b!915940 (= lt!411973 (select (arr!26178 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30950 0))(
  ( (Unit!30951) )
))
(declare-fun lt!411972 () Unit!30950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54471 (_ BitVec 64) (_ BitVec 32)) Unit!30950)

(assert (=> b!915940 (= lt!411972 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411973 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!915940 (arrayContainsKey!0 _keys!1487 lt!411973 #b00000000000000000000000000000000)))

(declare-fun lt!411971 () Unit!30950)

(assert (=> b!915940 (= lt!411971 lt!411972)))

(declare-fun res!617337 () Bool)

(declare-datatypes ((SeekEntryResult!8928 0))(
  ( (MissingZero!8928 (index!38083 (_ BitVec 32))) (Found!8928 (index!38084 (_ BitVec 32))) (Intermediate!8928 (undefined!9740 Bool) (index!38085 (_ BitVec 32)) (x!78247 (_ BitVec 32))) (Undefined!8928) (MissingVacant!8928 (index!38086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54471 (_ BitVec 32)) SeekEntryResult!8928)

(assert (=> b!915940 (= res!617337 (= (seekEntryOrOpen!0 (select (arr!26178 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8928 #b00000000000000000000000000000000)))))

(assert (=> b!915940 (=> (not res!617337) (not e!514032))))

(declare-fun b!915941 () Bool)

(assert (=> b!915941 (= e!514034 e!514033)))

(declare-fun c!96330 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!915941 (= c!96330 (validKeyInArray!0 (select (arr!26178 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40588 () Bool)

(assert (=> bm!40588 (= call!40591 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!113055 (not res!617338)) b!915941))

(assert (= (and b!915941 c!96330) b!915940))

(assert (= (and b!915941 (not c!96330)) b!915938))

(assert (= (and b!915940 res!617337) b!915939))

(assert (= (or b!915939 b!915938) bm!40588))

(declare-fun m!850843 () Bool)

(assert (=> b!915940 m!850843))

(declare-fun m!850845 () Bool)

(assert (=> b!915940 m!850845))

(declare-fun m!850847 () Bool)

(assert (=> b!915940 m!850847))

(assert (=> b!915940 m!850843))

(declare-fun m!850849 () Bool)

(assert (=> b!915940 m!850849))

(assert (=> b!915941 m!850843))

(assert (=> b!915941 m!850843))

(declare-fun m!850851 () Bool)

(assert (=> b!915941 m!850851))

(declare-fun m!850853 () Bool)

(assert (=> bm!40588 m!850853))

(assert (=> b!915878 d!113055))

(declare-fun mapIsEmpty!30570 () Bool)

(declare-fun mapRes!30570 () Bool)

(assert (=> mapIsEmpty!30570 mapRes!30570))

(declare-fun mapNonEmpty!30570 () Bool)

(declare-fun tp!58638 () Bool)

(declare-fun e!514039 () Bool)

(assert (=> mapNonEmpty!30570 (= mapRes!30570 (and tp!58638 e!514039))))

(declare-fun mapKey!30570 () (_ BitVec 32))

(declare-fun mapRest!30570 () (Array (_ BitVec 32) ValueCell!9122))

(declare-fun mapValue!30570 () ValueCell!9122)

(assert (=> mapNonEmpty!30570 (= mapRest!30561 (store mapRest!30570 mapKey!30570 mapValue!30570))))

(declare-fun b!915949 () Bool)

(declare-fun e!514040 () Bool)

(assert (=> b!915949 (= e!514040 tp_is_empty!19207)))

(declare-fun b!915948 () Bool)

(assert (=> b!915948 (= e!514039 tp_is_empty!19207)))

(declare-fun condMapEmpty!30570 () Bool)

(declare-fun mapDefault!30570 () ValueCell!9122)

(assert (=> mapNonEmpty!30561 (= condMapEmpty!30570 (= mapRest!30561 ((as const (Array (_ BitVec 32) ValueCell!9122)) mapDefault!30570)))))

(assert (=> mapNonEmpty!30561 (= tp!58629 (and e!514040 mapRes!30570))))

(assert (= (and mapNonEmpty!30561 condMapEmpty!30570) mapIsEmpty!30570))

(assert (= (and mapNonEmpty!30561 (not condMapEmpty!30570)) mapNonEmpty!30570))

(assert (= (and mapNonEmpty!30570 ((_ is ValueCellFull!9122) mapValue!30570)) b!915948))

(assert (= (and mapNonEmpty!30561 ((_ is ValueCellFull!9122) mapDefault!30570)) b!915949))

(declare-fun m!850855 () Bool)

(assert (=> mapNonEmpty!30570 m!850855))

(check-sat (not b!915941) (not b!915940) tp_is_empty!19207 (not b!915928) (not mapNonEmpty!30570) (not b!915929) (not bm!40588))
(check-sat)
